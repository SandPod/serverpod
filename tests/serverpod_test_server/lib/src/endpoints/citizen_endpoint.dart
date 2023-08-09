import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CitizenEndpoint extends Endpoint {
  Future<List<Citizen>> getAllShallow(Session session) async {
    return await Citizen.find(session, orderBy: Citizen.t.id);
  }

  Future<List<Citizen>> getAllWithDeepIncludes(Session session) async {
    return await Citizen.find(
      session,
      orderBy: Citizen.t.id,
      include: CitizenInclude(
        company: CompanyInclude(town: TownInclude()),
        oldCompany: CompanyInclude(town: TownInclude()),
      ),
    );
  }
}
