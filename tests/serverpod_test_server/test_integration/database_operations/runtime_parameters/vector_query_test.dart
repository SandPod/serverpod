import 'dart:math' as math;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_tags.dart';
import 'package:test/test.dart';

import '../../test_tools/serverpod_test_tools.dart';

const totalVectors = 5000;
const vectorDimension = 512;

void main() {
  withServerpod(
    'Given a large number of vectors with very similar distances',
    (final sessionBuilder, _) {
      final session = sessionBuilder.build();
      final queryVector = Vector(
        [0.5, 0.5] + List.filled(vectorDimension - 2, 0.0),
      );

      setUpAll(() async {
        final random = math.Random(42);
        final zeroFilledVector = Vector(List.filled(vectorDimension, 0.0));

        // Create 5000 vectors with very similar distances around the query point
        // [0.5, 0.5, ...]. This creates many borderline cases where low efSearch
        // might miss some vectors.
        final testVectors = [
          for (int i = 0; i < totalVectors; i++)
            ObjectWithVector(
              vector: zeroFilledVector,
              vectorIndexedHnsw: generateTestVector(i, random: random),
              vectorIndexedHnswWithParams: zeroFilledVector,
              vectorIndexedIvfflat: zeroFilledVector,
              vectorIndexedIvfflatWithParams: zeroFilledVector,
            ),
        ];

        await ObjectWithVector.db.insert(session, testVectors);
      });

      group('when using conservative and aggressive index query parameters', () {
        late List<ObjectWithVector> conservativeResults;
        late List<ObjectWithVector> aggressiveResults;

        /// Runs a vector query with the given efSearch and iterativeScan
        /// parameters. Sequential scan is disabled to ensure that the queries
        /// only use the HNSW index and are affected by the efSearch parameter.
        Future<List<ObjectWithVector>> runVectorQuery({
          required final int efSearch,
          required final IterativeScan iterativeScan,
        }) async {
          return session.db.transaction((final transaction) async {
            await transaction.setRuntimeParameters(
              (final params) => [
                params.vectorIndexQuery(enableSeqScan: false),
                params.hnswIndexQuery(
                  efSearch: efSearch,
                  iterativeScan: iterativeScan,
                ),
              ],
            );

            return ObjectWithVector.db.find(
              session,
              orderBy: (final t) => t.vectorIndexedHnsw.distanceL2(queryVector),
              limit: 30,
              transaction: transaction,
            );
          });
        }

        setUpAll(() async {
          conservativeResults = await runVectorQuery(
            efSearch: 2,
            iterativeScan: IterativeScan.relaxed,
          );

          aggressiveResults = await runVectorQuery(
            efSearch: 500,
            iterativeScan: IterativeScan.strict,
          );
        });

        test('then intersection ratio of found vectors is less than 0.5.', () {
          final conservativeIds = conservativeResults.map((final v) => v.id).toSet();
          final aggressiveIds = aggressiveResults.map((final v) => v.id).toSet();

          final intersection = conservativeIds.intersection(aggressiveIds);
          final unionSize = conservativeIds.union(aggressiveIds).length;
          final intersectionRatio = intersection.length / unionSize;

          print('Conservative IDs: $conservativeIds');
          print('Aggressive IDs: $aggressiveIds');
          print('Intersection ratio: $intersectionRatio');
          // Usually less than 0.1, but we allow up to 0.5 to avoid flakiness.
          expect(intersectionRatio, lessThan(0.5));
        });

        test(
          'then aggressive efSearch top vector is at least as close to query vector.',
          () {
            final conservativeFirst =
                conservativeResults.first.vectorIndexedHnsw;
            final aggressiveFirst = aggressiveResults.first.vectorIndexedHnsw;

            final conservativeBest = l2(conservativeFirst, queryVector);
            final aggressiveBest = l2(aggressiveFirst, queryVector);

            print('Best conservative distance: $conservativeBest');
            print('Best aggressive distance: $aggressiveBest');
            expect(aggressiveBest, lessThanOrEqualTo(conservativeBest));
          },
        );

        test(
          'then aggressive efSearch average results are closer to query vector.',
          () {
            final conservativeAvg = avgL2(conservativeResults, queryVector);
            final aggressiveAvg = avgL2(aggressiveResults, queryVector);

            print('Average conservative distance: $conservativeAvg');
            print('Average aggressive distance: $aggressiveAvg');
            expect(aggressiveAvg, lessThan(conservativeAvg));
          },
        );
      });
    },
    testGroupTagsOverride: [TestTags.concurrencyOneTestTag],
  );
}

/// Helper function to generate test vectors with very similar distances.
Vector generateTestVector(final int i, {required final math.Random random}) {
  final baseVector = List<double>.filled(vectorDimension, 0.0);

  // Create vectors clustered around distance 0.5 from query point with very
  // small random variations to create borderline cases.
  final angle = (i * 2 * math.pi) / totalVectors;
  final radiusVariation = 0.01 * nextGaussian(random);
  final baseRadius = 0.5 + radiusVariation;

  // Place vectors in a spiral pattern with small random noise.
  baseVector[0] =
      0.5 + baseRadius * math.cos(angle) + 0.005 * nextGaussian(random);
  baseVector[1] =
      0.5 + baseRadius * math.sin(angle) + 0.005 * nextGaussian(random);

  // Add noise to other dimensions to increase complexity.
  for (int j = 2; j < (vectorDimension ~/ 10 - 1); j++) {
    baseVector[j] = 0.002 * nextGaussian(random);
  }

  return Vector(baseVector);
}

/// Helper for normal (Gaussian) distributed random numbers.
double nextGaussian(final math.Random rng) {
  final double u1 = rng.nextDouble();
  final double u2 = rng.nextDouble();
  return math.sqrt(-2.0 * math.log(u1)) * math.cos(2.0 * math.pi * u2);
}

/// Calculates the L2 distance between two vectors.
double l2(final Vector a, final Vector b) {
  final aList = a.toList();
  final bList = b.toList();
  double sum = 0.0;
  for (int i = 0; i < aList.length; i++) {
    final d = aList[i] - bList[i];
    sum += d * d;
  }
  return math.sqrt(sum);
}

/// Calculates the average L2 distance of a list of results against a query vector.
double avgL2(final List<ObjectWithVector> results, final Vector query) {
  if (results.isEmpty) return double.infinity;
  return results
          .map((final v) => l2(v.vectorIndexedHnsw, query))
          .reduce((final a, final b) => a + b) /
      results.length;
}
