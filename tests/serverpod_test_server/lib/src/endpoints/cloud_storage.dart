import 'dart:typed_data';

import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CloudStorageEndpoint extends Endpoint {
  Future<void> reset(final Session session) async {
    // Remove all entries
    await CloudStorageEntry.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );
    await CloudStorageDirectUploadEntry.db.deleteWhere(
      session,
      where: (final t) => Constant.bool(true),
    );
  }

  Future<void> storePublicFile(
    final Session session,
    final String path,
    final ByteData byteData,
  ) async {
    await session.storage.storeFile(
      storageId: 'public',
      path: path,
      byteData: byteData,
    );
  }

  Future<ByteData?> retrievePublicFile(final Session session, final String path) async {
    return await session.storage.retrieveFile(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool?> existsPublicFile(final Session session, final String path) async {
    return await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );
  }

  Future<void> deletePublicFile(final Session session, final String path) async {
    await session.storage.deleteFile(
      storageId: 'public',
      path: path,
    );
  }

  Future<String?> getPublicUrlForFile(final Session session, final String path) async {
    final uri = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );
    return uri?.toString();
  }

  Future<String?> getDirectFilePostUrl(final Session session, final String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyDirectFileUpload(final Session session, final String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }
}
