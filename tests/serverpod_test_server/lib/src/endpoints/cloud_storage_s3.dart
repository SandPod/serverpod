import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

// int globalInt = 0;

class S3CloudStorageEndpoint extends Endpoint {
  // Future<void> reset(Session session) async {
  //   // Remove all entries
  //   await session.db.delete(tCloudStorageEntry, where: Constant(true));
  //   await session.db.delete(tCloudStorageDirectUploadEntry, where: Constant(true));
  // }

  Future<void> storePublicFile(
    final Session session,
    final String path,
    final ByteData byteData,
  ) async {
    await session.storage.storeFile(
      storageId: 's3',
      path: path,
      byteData: byteData,
    );
  }

  Future<ByteData?> retrievePublicFile(final Session session, final String path) async {
    return await session.storage.retrieveFile(
      storageId: 's3',
      path: path,
    );
  }

  Future<bool?> existsPublicFile(final Session session, final String path) async {
    return await session.storage.fileExists(
      storageId: 's3',
      path: path,
    );
  }

  Future<void> deletePublicFile(final Session session, final String path) async {
    await session.storage.deleteFile(
      storageId: 's3',
      path: path,
    );
  }

  Future<String?> getPublicUrlForFile(final Session session, final String path) async {
    final uri = await session.storage.getPublicUrl(storageId: 's3', path: path);
    return uri?.toString();
  }

  Future<String?> getDirectFilePostUrl(final Session session, final String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 's3',
      path: path,
    );
  }

  Future<bool> verifyDirectFileUpload(final Session session, final String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 's3',
      path: path,
    );
  }
}
