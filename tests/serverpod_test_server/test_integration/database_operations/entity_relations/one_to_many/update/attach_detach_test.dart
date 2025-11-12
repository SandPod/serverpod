import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

void main() async {
  final session = await IntegrationTestServer().session();

  tearDown(() async {
    await Person.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    await City.db.deleteWhere(session, where: (final t) => Constant.bool(true));
    await Organization.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );
  });

  test(
    'Given an implicit list relation of a city and person when attaching the person to the city then the city list contains the person',
    () async {
      final city = await City.db.insertRow(session, City(name: 'Stockholm'));

      final citizen = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      await City.db.attachRow.citizens(session, city, citizen);

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );
      final updatedCitizen = await Person.db.findById(session, citizen.id!);

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        contains(jsonEncode(updatedCitizen?.toJson())),
      );
    },
  );

  test(
    'Given an implicit list relation of a city and two persons when attaching the persons to the city then both persons are in the city list',
    () async {
      final city = await City.db.insertRow(
        session,
        City(name: 'Stockholm'),
      );

      final citizen1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final citizen2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );

      await City.db.attach.citizens(session, city, [citizen1, citizen2]);

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );
      final updatedCitizen1 = await Person.db.findById(session, citizen1.id!);
      final updatedCitizen2 = await Person.db.findById(session, citizen2.id!);

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        containsAll([
          jsonEncode(updatedCitizen1?.toJson()),
          jsonEncode(updatedCitizen2?.toJson()),
        ]),
      );
    },
  );

  test(
    'Given an implicit list relation of a city with two persons when detaching one of the persons from the city then it is no longer contained in the city citizens list.',
    () async {
      final city = await City.db.insertRow(
        session,
        City(name: 'Stockholm'),
      );

      final citizen1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final citizen2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );

      await City.db.attach.citizens(session, city, [citizen1, citizen2]);

      await City.db.detachRow.citizens(session, citizen1);

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(contains(jsonEncode(citizen1.toJson()))),
      );
    },
  );

  test(
    'Given an implicit list relation of a city with two persons when detaching both of the persons from the city then they are no longer contained in the city citizens list.',
    () async {
      final city = await City.db.insertRow(
        session,
        City(name: 'Stockholm'),
      );

      final citizen1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final citizen2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );

      await City.db.attach.citizens(session, city, [citizen1, citizen2]);
      await City.db.detach.citizens(session, [citizen1, citizen2]);

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(contains(jsonEncode(citizen1.toJson()))),
      );
      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(contains(jsonEncode(citizen2.toJson()))),
      );
    },
  );

  test(
    'Given an explicit list relation of an organization and person when attaching the person to the organization then the people list contains the person',
    () async {
      final org = await Organization.db.insertRow(
        session,
        Organization(name: 'The organization'),
      );

      final people = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      await Organization.db.attachRow.people(session, org, people);

      final updatedOrg = await Organization.db.findById(
        session,
        org.id!,
        include: Organization.include(people: Person.includeList()),
      );

      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        contains(
          jsonEncode(people.copyWith(organizationId: org.id).toJson()),
        ),
      );
    },
  );

  test(
    'Given an explicit list relation of an organization and two persons when attaching the persons to the organization then both persons are in the people list',
    () async {
      final org = await Organization.db.insertRow(
        session,
        Organization(name: 'The organization'),
      );

      final person1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final person2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );
      await Organization.db.attach.people(session, org, [person1, person2]);

      final updatedOrg = await Organization.db.findById(
        session,
        org.id!,
        include: Organization.include(people: Person.includeList()),
      );

      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        contains(
          jsonEncode(person1.copyWith(organizationId: org.id).toJson()),
        ),
      );
      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        contains(
          jsonEncode(person2.copyWith(organizationId: org.id).toJson()),
        ),
      );
    },
  );

  test(
    'Given an explicit list relation of a organization with two persons when detaching one of the persons from the organization then it is no longer contained in the people list.',
    () async {
      final org = await Organization.db.insertRow(
        session,
        Organization(name: 'The organization'),
      );

      final person1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final person2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );

      await Organization.db.attach.people(session, org, [person1, person2]);

      await Organization.db.detachRow.people(session, person1);

      final updatedOrg = await Organization.db.findById(
        session,
        org.id!,
        include: Organization.include(people: Person.includeList()),
      );

      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(
          contains(
            jsonEncode(person1.copyWith(organizationId: org.id).toJson()),
          ),
        ),
      );
    },
  );

  test(
    'Given an explicit list relation of a organization with two persons when detaching both of the persons from the organization then they are no longer contained in the people list.',
    () async {
      final org = await Organization.db.insertRow(
        session,
        Organization(name: 'The organization'),
      );

      final person1 = await Person.db.insertRow(
        session,
        Person(name: 'John Doe'),
      );

      final person2 = await Person.db.insertRow(
        session,
        Person(name: 'Jane Doe'),
      );
      await Organization.db.attach.people(session, org, [person1, person2]);

      await Organization.db.detach.people(session, [person1, person2]);

      final updatedOrg = await Organization.db.findById(
        session,
        org.id!,
        include: Organization.include(people: Person.includeList()),
      );

      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(
          contains(
            jsonEncode(person1.copyWith(organizationId: org.id).toJson()),
          ),
        ),
      );
      expect(
        updatedOrg?.people?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        isNot(
          contains(
            jsonEncode(person2.copyWith(organizationId: org.id).toJson()),
          ),
        ),
      );
    },
  );

  test(
    'Given using `attachRow` and `detachRow` inside a transaction when attaching two persons and detaching one then the city list contains the remaining person',
    () async {
      final city = await City.db.insertRow(session, City(name: 'Stockholm'));
      final person1 = await Person.db.insertRow(session, Person(name: 'Person1'));
      final person2 = await Person.db.insertRow(session, Person(name: 'Person2'));

      await session.db.transaction((final Transaction transaction) async {
        await City.db.attachRow.citizens(
          session,
          city,
          person1,
          transaction: transaction,
        );
        await City.db.attachRow.citizens(
          session,
          city,
          person2,
          transaction: transaction,
        );
        await City.db.detachRow.citizens(
          session,
          person2,
          transaction: transaction,
        );
      });

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );
      final updatedPerson1 = await Person.db.findById(session, person1.id!);
      final updatedPerson2 = await Person.db.findById(session, person2.id!);

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        allOf(
          contains(jsonEncode(updatedPerson1?.toJson())),
          isNot(
            contains(jsonEncode(updatedPerson2?.toJson())),
          ),
        ),
      );
    },
  );

  test(
    'Given using `attach` and `detach` inside a transaction when attaching two persons and detaching one then the city list contains the remaining person',
    () async {
      final city = await City.db.insertRow(session, City(name: 'Stockholm'));
      final person1 = await Person.db.insertRow(session, Person(name: 'Person1'));
      final person2 = await Person.db.insertRow(session, Person(name: 'Person2'));

      await session.db.transaction((final Transaction transaction) async {
        await City.db.attach.citizens(session, city, [
          person1,
          person2,
        ], transaction: transaction);
        await City.db.detach.citizens(session, [
          person2,
        ], transaction: transaction);
      });

      final updatedCity = await City.db.findById(
        session,
        city.id!,
        include: City.include(
          citizens: Person.includeList(),
        ),
      );
      final updatedPerson1 = await Person.db.findById(session, person1.id!);
      final updatedPerson2 = await Person.db.findById(session, person2.id!);

      expect(
        updatedCity?.citizens?.toJson(
          valueToJson: (final el) => jsonEncode(el.toJson()),
        ),
        allOf(
          contains(jsonEncode(updatedPerson1?.toJson())),
          isNot(
            contains(jsonEncode(updatedPerson2?.toJson())),
          ),
        ),
      );
    },
  );
}
