import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class Database extends Endpoint {
  Future<SmallMessage> roundtripSmall(
    Session session,
    SmallMessage message,
  ) async {
    return await SmallMessage.db.insertRow(session, message);
  }

  Future<LargeMessage> roundtripLarge(
    Session session,
    LargeMessage message,
  ) async {
    return await LargeMessage.db.insertRow(session, message);
  }

  Future<void> insertSmall(Session session, SmallMessage message) async {
    await SmallMessage.db.insertRow(session, message);
  }

  Future<void> insertLarge(Session session, LargeMessage message) async {
    await LargeMessage.db.insertRow(session, message);
  }

  Future<SmallMessage?> getSmall(Session session, int id) async {
    return await SmallMessage.db.findById(session, id);
  }

  Future<LargeMessage?> getLarge(Session session, int id) async {
    return await LargeMessage.db.findById(session, id);
  }

  Future<SmallMessage?> getWithRelationsSmall(Session session, int id) async {
    return await SmallMessage.db.findById(
      session,
      id,
      include: SmallMessage.include(
        next: SmallMessage.include(
          next: SmallMessage.include(
            next: SmallMessage.include(
              next: SmallMessage.include(
                next: SmallMessage.include(
                  next: SmallMessage.include(
                    next: SmallMessage.include(
                      next: SmallMessage.include(
                        next: SmallMessage.include(
                          next: SmallMessage.include(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<LargeMessage?> getWithRelationLarge(Session session, int id) async {
    return await LargeMessage.db.findById(
      session,
      id,
      include: LargeMessage.include(
        next: LargeMessage.include(
          next: LargeMessage.include(
            next: LargeMessage.include(
              next: LargeMessage.include(
                next: LargeMessage.include(
                  next: LargeMessage.include(
                    next: LargeMessage.include(
                      next: LargeMessage.include(
                        next: LargeMessage.include(
                          next: LargeMessage.include(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
