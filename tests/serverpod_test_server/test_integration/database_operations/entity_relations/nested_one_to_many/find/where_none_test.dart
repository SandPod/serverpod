import 'package:serverpod/database.dart' as db;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  group('Given models with one to many relation nested in a one to one relation', () {
    tearDown(() async {
      await Player.db.deleteWhere(
        session,
        where: (_) => db.Constant.bool(true),
      );
      await Team.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
      await Arena.db.deleteWhere(session, where: (_) => db.Constant.bool(true));
    });

    test(
      'when fetching models filtered on none of nested many relation then result is as expected.',
      () async {
        final players = await Player.db.insert(session, [
          Player(name: 'Alex'),
          Player(name: 'Viktor'),
          Player(name: 'Isak'),
        ]);

        final arenas = await Arena.db.insert(session, [
          Arena(name: 'Eagle Stadium'),
          Arena(name: 'Bulls Arena'),
          Arena(name: 'Shark Tank'),
        ]);

        final teams = await Team.db.insert(session, [
          Team(name: 'Eagles', arenaId: arenas[0].id),
          Team(name: 'Bulls', arenaId: arenas[1].id),
          Team(name: 'Sharks', arenaId: arenas[2].id),
        ]);

        // Attach Alex and Viktor to Eagles
        await Team.db.attach.players(session, teams[0], players.sublist(0, 2));
        // Attach Isak to Bulls
        await Team.db.attachRow.players(session, teams[1], players[2]);

        final arenasFetched = await Arena.db.find(
          session,
          // Fetch all arenas with teams that have no players.
          where: (final a) => a.team.players.none(),
        );

        final arenaNames = arenasFetched.map((final e) => e.name);
        expect(arenaNames, ['Shark Tank']);
      },
    );

    test(
      'when fetching models filtered on filtered none of nested many relation then result is as expected.',
      () async {
        final players = await Player.db.insert(session, [
          Player(name: 'Alex'),
          Player(name: 'Viktor'),
          Player(name: 'Isak'),
        ]);

        final arenas = await Arena.db.insert(session, [
          Arena(name: 'Eagle Stadium'),
          Arena(name: 'Bulls Arena'),
          Arena(name: 'Shark Tank'),
        ]);

        final teams = await Team.db.insert(session, [
          Team(name: 'Eagles', arenaId: arenas[0].id),
          Team(name: 'Bulls', arenaId: arenas[1].id),
          Team(name: 'Sharks', arenaId: arenas[2].id),
        ]);

        // Attach Alex and Viktor to Eagles
        await Team.db.attach.players(session, teams[0], players.sublist(0, 2));
        // Attach Isak to Bulls
        await Team.db.attachRow.players(session, teams[1], players[2]);

        final arenasFetched = await Arena.db.find(
          session,
          // Fetch all arenas with teams that have no players with a name starting with a.
          where: (final a) => a.team.players.none((final p) => p.name.ilike('a%')),
        );

        final arenaNames = arenasFetched.map((final e) => e.name);
        expect(arenaNames, hasLength(2));
        expect(arenaNames, containsAll(['Shark Tank', 'Bulls Arena']));
      },
    );
  });
}
