import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test_nonvector_server/src/generated/protocol.dart';

class BirthdayReminder extends FutureCall<Greeting> {
  @override
  Future<void> invoke(final Session session, final Greeting? object) async {
    session.log('${object?.message} Remember to send a birthday card!');
  }
}
