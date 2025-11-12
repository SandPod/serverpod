import 'package:serverpod/protocol.dart' as serverpod;
import 'package:serverpod_test_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  final protocol = Protocol();

  test(
    'Given a  integer when encoding then output is the type name and value as a JSON string',
    () {
      const int number = 1;
      final typeName = protocol.encodeWithType(number);
      expect(typeName, '{"className":"int","data":1}');
    },
  );

  test(
    'Given a non-null nullable integer when encoding then output is the type name and value as a JSON string',
    () {
      const int number = 1;
      final typeName = protocol.encodeWithType(number);
      expect(typeName, '{"className":"int","data":1}');
    },
  );

  test(
    "Given a null nullable integer when encoding then output is 'null' for both the type name and data as a JSON string",
    () {
      final int? number;
      final typeName = protocol.encodeWithType(number);
      expect(typeName, '{"className":"null","data":null}');
    },
  );

  test(
    'Given a non-null SimpleData object when encoding then output is the type name and value as a JSON string',
    () {
      final SimpleData simpleData = SimpleData.fromJson({'num': 1});
      final typeName = protocol.encodeWithType(simpleData);
      expect(typeName, '{"className":"SimpleData","data":{"num":1}}');
    },
  );

  test(
    'Given a non-null nullable SimpleData object when encoding then output is the type name and value as a JSON string',
    () {
      final SimpleData simpleData = SimpleData.fromJson({'num': 1});
      final typeName = protocol.encodeWithType(simpleData);
      expect(typeName, '{"className":"SimpleData","data":{"num":1}}');
    },
  );

  test(
    "Given a nullable SimpleData object with a null value when encoding then output is 'null' for both the type name and data as a JSON string",
    () {
      final SimpleData? simpleData;
      final typeName = protocol.encodeWithType(simpleData);
      expect(typeName, '{"className":"null","data":null}');
    },
  );

  test(
    'Given a Serverpod defined model when encoding with type then output is the type name and value as a JSON string',
    () {
      final serverpodDefinedModel = serverpod.ClusterServerInfo(
        serverId: 'Hello World',
      );
      final typeName = protocol.encodeWithType(serverpodDefinedModel);

      expect(
        typeName,
        '{"className":"serverpod.ClusterServerInfo","data":{"serverId":"Hello World"}}',
      );
    },
  );
}
