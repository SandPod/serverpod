import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';

class UploadEndpoint extends Endpoint {
  Future<bool> uploadByteData(
    final Session session,
    final String path,
    final ByteData data,
  ) async {
    print('path: "$path", lengthInBytes: ${data.lengthInBytes}');
    return true;
  }
}
