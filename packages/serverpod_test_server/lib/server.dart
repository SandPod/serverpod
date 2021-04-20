import 'package:serverpod/serverpod.dart';
import 'src/futureCalls/test_call.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

void run(List<String> args) async {
  // Create serverpod
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  pod.registerFutureCall(TestCall(), 'testCall');

  await pod.start();
}