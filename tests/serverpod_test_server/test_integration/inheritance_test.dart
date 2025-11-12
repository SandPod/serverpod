import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:serverpod_test_server/test_util/test_serverpod.dart';
import 'package:test/test.dart';

Future<void> _deleteAll(final Session session) async {
  await ParentClass.db.deleteWhere(
    session,
    where: (final element) => Constant.bool(true),
  );
}

String switchOnSealedClass(final SealedParent sealedClass) {
  switch (sealedClass) {
    case SealedChild():
      return 'Handled SealedChild';
    case SealedOtherChild():
      return 'Handled SealedOtherChild';
  }
}

void main() async {
  final session = await IntegrationTestServer().session();

  tearDownAll(() async => await _deleteAll(session));

  test(
    'Given a class that extends another class, then the child-class is a sub-type of the parent-class',
    () {
      final childClass = ChildClass(
        grandParentField: 'grandParentField',
        parentField: 'parentField',
        childField: 2,
      );

      expect(childClass, isA<ParentClass>());
    },
  );

  test(
    'Given an instantiated child-class when inserted into the parent-class table, then inherited fields should be retrievable from the parent-class table',
    () async {
      final childClass = ChildClass(
        grandParentField: 'grandParentField',
        parentField: 'parentField',
        childField: 2,
      );

      final childInParentDb = await ParentClass.db.insertRow(session, childClass);
      final parentDbFirstRow = await ParentClass.db.findFirstRow(session);

      expect(childInParentDb.id, parentDbFirstRow!.id);
      expect(childClass.grandParentField, parentDbFirstRow.grandParentField);
      expect(childClass.parentField, parentDbFirstRow.parentField);
    },
  );

  test(
    'Given a sealed top node, when calling a switch statement on its sub-classes, then the subtypes are handled correctly',
    () async {
      final sealedChild = SealedChild(
        sealedInt: 1,
        sealedString: 'Child',
      );
      final sealedOtherChild = SealedOtherChild(
        sealedInt: 3,
        sealedString: 'GrandParent',
        sealedOtherChildField: 4,
      );

      expect(
        switchOnSealedClass(sealedChild),
        equals('Handled SealedChild'),
      );
      expect(
        switchOnSealedClass(sealedOtherChild),
        equals('Handled SealedOtherChild'),
      );
    },
  );
}
