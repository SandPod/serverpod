import 'package:serverpod_test_client/src/protocol/client.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() async {
  var client = Client(serverUrl);

  /**
   * Loaded from relation_db.pgsql
   * Town:[
   *  {
   *   id: 1,
   *   name: 'Stockholm',
   *  },
   *  {
   *   id: 2,
   *   name: 'Skinnskatteberg',
   *  }
   * ]
   * 
   * Company:[
   *  {
   *   id: 1,
   *   name: 'Serverpod',
   *   townId: 1
   *  },
   *  {
   *   id: 2,
   *   name: 'Systemair',
   *   townId: 2
   *  },
   * ]
   * 
   * Citizen: [
   *  {
   *    id: 1,
   *    name: 'Alex',
   *    companyId: 1,
   *    oldCompanyId: 2
   *  },
   *  {
   *    id: 2,
   *    name: 'Isak',
   *    companyId: 1,
   *    oldCompanyId: NULL
   *  },
   * ]
   * 
   */
  var citizensWithDeepIncludes = await client.citizen.getAllWithDeepIncludes();

  group(
      'Given serverpod instance with data as described above when fetching all citizens including related data ordered by id',
      () {
    test('Then the correct number of citizens should be returned', () {
      expect(citizensWithDeepIncludes.length, 2);
    });

    group('then first citizen fetched', () {
      var firstCitizen = citizensWithDeepIncludes[0];
      test('has correct id.', () {
        expect(firstCitizen.id, 1);
      });

      test('has correct name.', () {
        expect(firstCitizen.name, 'Alex');
      });

      test('has correct company.', () {
        expect(firstCitizen.company?.name, 'Serverpod');
      });

      test('has correct company town.', () {
        expect(firstCitizen.company?.town?.name, 'Stockholm');
      });

      test('has correct oldCompany.', () {
        expect(firstCitizen.oldCompany?.name, 'Systemair');
      });

      test('has correct oldCompany town.', () {
        expect(firstCitizen.oldCompany?.town?.name, 'Skinnskatteberg');
      });
    },
        skip: citizensWithDeepIncludes.length != 2
            ? 'Unexpected number of citizens.'
            : false);

    group('then second citizen fetched', () {
      var secondCitizen = citizensWithDeepIncludes[1];
      test('has correct id.', () {
        expect(secondCitizen.id, 2);
      });

      test('has correct name.', () {
        expect(secondCitizen.name, 'Isak');
      });

      test('has correct company.', () {
        expect(secondCitizen.company?.name, 'Serverpod');
      });

      test('has correct company town.', () {
        expect(secondCitizen.company?.town?.name, 'Stockholm');
      });

      test('does NOT have oldCompany.', () {
        expect(secondCitizen.oldCompany, isNull);
      });
    },
        skip: citizensWithDeepIncludes.length != 2
            ? 'Unexpected number of citizens.'
            : false);
  });

  var citizensShallow = await client.citizen.getAllShallow();
  group(
      'Given serverpod instance with data as described above when shallow fetching all citizens ordered by id',
      () {
    test('Then the correct number of citizens should be returned', () {
      expect(citizensShallow.length, 2);
    });

    group('then first citizen fetched', () {
      var firstCitizen = citizensShallow[0];
      test('has correct id.', () {
        expect(firstCitizen.id, 1);
      });

      test('has correct name.', () {
        expect(firstCitizen.name, 'Alex');
      });

      test('does NOT have company.', () {
        expect(firstCitizen.company, isNull);
      });

      test('does NOT have oldCompany.', () {
        expect(firstCitizen.oldCompany, isNull);
      });
    },
        skip: citizensShallow.length != 2
            ? 'Unexpected number of citizens.'
            : false);

    group('then second citizen fetched', () {
      var secondCitizen = citizensShallow[1];
      test('has correct id.', () {
        expect(secondCitizen.id, 2);
      });

      test('has correct name.', () {
        expect(secondCitizen.name, 'Isak');
      });

      test('does NOT have company.', () {
        expect(secondCitizen.company, isNull);
      });

      test('does NOT have oldCompany.', () {
        expect(secondCitizen.oldCompany, isNull);
      });
    },
        skip: citizensShallow.length != 2
            ? 'Unexpected number of citizens.'
            : false);
  });
}
