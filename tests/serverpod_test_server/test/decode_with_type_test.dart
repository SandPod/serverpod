import 'package:serverpod/protocol.dart' as serverpod;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  final protocol = Protocol();

  test(
    'Given a integer when encoding and decoding with type then output matches input',
    () {
      const int number = 1;
      final encoded = protocol.encodeWithType(number);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, number);
    },
  );

  test(
    'Given a non-null nullable integer when encoding and decoding with type then output matches input',
    () {
      const int number = 1;
      final encoded = protocol.encodeWithType(number);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, number);
    },
  );

  test(
    'Given a null nullable integer when encoding and decoding with type then output matches input',
    () {
      final int? number;
      final encoded = protocol.encodeWithType(number);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, number);
    },
  );

  test(
    'Given a non-null SimpleData object when encoding and decoding with type then output matches input',
    () {
      final SimpleData simpleData = SimpleData.fromJson({'num': 1});
      final encoded = protocol.encodeWithType(simpleData);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, isA<SimpleData>());
      expect(simpleData.isEqual(decoded), true);
    },
  );

  test(
    'Given a non-null nullable SimpleData object when encoding and decoding with type then output matches input',
    () {
      final SimpleData simpleData = SimpleData.fromJson({'num': 1});
      final encoded = protocol.encodeWithType(simpleData);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, isA<SimpleData>());
      expect(simpleData.isEqual(decoded), true);
    },
  );

  test(
    'Given a null nullable SimpleData object when encoding and decoding with type then output matches input',
    () {
      final SimpleData? simpleData;
      final encoded = protocol.encodeWithType(simpleData);
      final decoded = protocol.decodeWithType(encoded);
      expect(decoded, simpleData);
      expect(decoded is SimpleData?, true);
    },
  );

  test(
    'Given a Serverpod defined model when encoding and decoding with type then output matches input',
    () {
      final serverpodDefinedModel = serverpod.ClusterServerInfo(
        serverId: 'Hello World',
      );
      final encoded = protocol.encodeWithType(serverpodDefinedModel);
      final decoded = protocol.decodeWithType(encoded);

      expect(decoded, isA<serverpod.ClusterServerInfo>());
      expect(
        (decoded as serverpod.ClusterServerInfo).serverId,
        serverpodDefinedModel.serverId,
      );
    },
  );
}

extension _SimpleDataExtension on SimpleData {
  bool isEqual(final Object? other) {
    if (identical(this, other)) return true;
    return other is SimpleData && other.num == this.num;
  }
}
