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
      'when counting models filtered on nested many relation count then result is as expected.',
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

        final numberOfArenas = await Arena.db.count(
          session,
          // Count all arenas with teams that have more than one player.
          where: (final a) => a.team.players.count() > 1,
        );

        expect(numberOfArenas, 1);
      },
    );

    test(
      'when fetching models filtered on filtered nested many relation count then result is as expected.',
      () async {
        final players = await Player.db.insert(session, [
          Player(name: 'Alex'),
          Player(name: 'Viktor'),
          Player(name: 'Anna'),
          Player(name: 'Isak'),
          Player(name: 'Alice'),
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
        // Attach Alex, Viktor and Anna to Eagles
        await Team.db.attach.players(session, teams[0], players.sublist(0, 3));
        // Attach Isak And Alice to Bulls
        await Team.db.attach.players(session, teams[1], players.sublist(3, 5));

        final numberOfArenas = await Arena.db.count(
          session,
          // Count all arenas with teams that have any player with a name starting with a.
          where: (final a) => a.team.players.count((final p) => p.name.ilike('a%')) > 1,
        );

        expect(numberOfArenas, 1);
      },
    );
  });
}
