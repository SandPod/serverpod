import 'dart:async';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:serverpod_test_client/serverpod_test_client.dart';
import 'package:serverpod_test_server/test_util/config.dart';
import 'package:test/test.dart';

Stream<int> streamBytes() async* {
  int i = 0;
  while (true) {
    yield i++ % 256;
  }
}

extension<T> on Stream<T> {
  Stream<List<T>> inChunksOf(final int chunkSize) async* {
    var chunk = <T>[];
    await for (final e in this) {
      chunk.add(e);
      if (chunk.length >= chunkSize) {
        yield chunk;
        chunk = <T>[]; // new
      }
    }
  }
}

ByteData createByteData(final int len) {
  final ints = Uint8List(len);
  for (var i = 0; i < len; i++) {
    ints[i] = i % 256;
  }
  return ByteData.view(ints.buffer);
}

bool verifyByteData(final ByteData byteData) {
  final ints = byteData.buffer.asUint8List();
  for (var i = 0; i < ints.length; i++) {
    if (ints[i] != i % 256) return false;
  }
  return true;
}

void main() {
  final client = Client(serverUrl);

  setUp(() {});

  group('Database cloud storage', () {
    test('Clear files', () async {
      await client.cloudStorage.reset();
    });

    test('Store file 1', () async {
      await client.cloudStorage.storePublicFile(
        'testdir/myfile1.bin',
        createByteData(256),
      );
    });

    test('Store file 2', () async {
      await client.cloudStorage.storePublicFile(
        'testdir/myfile2.bin',
        createByteData(256),
      );
    });

    test('Replace file 1', () async {
      await client.cloudStorage.storePublicFile(
        'testdir/myfile1.bin',
        createByteData(128),
      );
    });

    test('Retrieve file 1', () async {
      final byteData = await client.cloudStorage.retrievePublicFile(
        'testdir/myfile1.bin',
      );
      expect(byteData!.lengthInBytes, equals(128));
      expect(verifyByteData(byteData), equals(true));
    });

    test('Retrieve file 2 through URL', () async {
      final url = Uri.parse(
        '${serverUrl}serverpod_cloud_storage?method=file&path=testdir/myfile2.bin',
      );
      final response = await http.get(url);
      expect(response.statusCode, equals(200));
      final bytes = response.bodyBytes;
      expect(bytes.length, equals(256));
      verifyByteData(ByteData.view(bytes.buffer));
    });

    test('Retrieve file 1 URL', () async {
      final urlStr = await client.cloudStorage.getPublicUrlForFile(
        'testdir/myfile1.bin',
      );
      expect(urlStr, isNotNull);
    });

    test('Retrieve file 2 through fetched URL', () async {
      final urlStr = await client.cloudStorage.getPublicUrlForFile(
        'testdir/myfile2.bin',
      );
      final url = Uri.parse(urlStr!);
      final response = await http.get(url);
      expect(response.statusCode, equals(200));
      final bytes = response.bodyBytes;
      expect(bytes.length, equals(256));
      verifyByteData(ByteData.view(bytes.buffer));
    });

    test('Retrieve file 2', () async {
      final byteData = await client.cloudStorage.retrievePublicFile(
        'testdir/myfile2.bin',
      );
      expect(byteData!.lengthInBytes, equals(256));
      expect(verifyByteData(byteData), equals(true));
    });

    test('Retrieve non existing file', () async {
      final byteData = await client.cloudStorage.retrievePublicFile(
        'testdir/myfile3.bin',
      );
      expect(byteData, isNull);
    });

    test('Retrieve non existing file through URL', () async {
      final url = Uri.parse(
        '${serverUrl}serverpod_cloud_storage?method=file&path=testdir/myfile3.bin',
      );
      final response = await http.get(url);
      expect(response.statusCode, equals(404));
    });

    test('Attempt retrieve file through URL with invalid params', () async {
      final url = Uri.parse(
        '${serverUrl}serverpod_cloud_storage?method=file&foo=testdir/myfile2.bin',
      );
      final response = await http.get(url);
      expect(response.statusCode, equals(400));
    });

    test('Attempt retrieve file through URL with invalid method', () async {
      final url = Uri.parse(
        '${serverUrl}serverpod_cloud_storage?foo=file&path=testdir/myfile2.bin',
      );
      final response = await http.get(url);
      expect(response.statusCode, equals(400));
    });

    test('Exists file 1', () async {
      final exists = await client.cloudStorage.existsPublicFile(
        'testdir/myfile1.bin',
      );
      expect(exists, true);
    });

    test('Exists non existing file', () async {
      final exists = await client.cloudStorage.existsPublicFile(
        'testdir/myfile3.bin',
      );
      expect(exists, false);
    });

    test('Delete file 1', () async {
      await client.cloudStorage.deletePublicFile('testdir/myfile1.bin');
    });

    test('Exists file 1 after deletion', () async {
      final exists = await client.cloudStorage.existsPublicFile(
        'testdir/myfile1.bin',
      );
      expect(exists, false);
    });

    test('Direct file upload (ByteData)', () async {
      final uploadDescription = await client.cloudStorage.getDirectFilePostUrl(
        'testdir/directupload.bin',
      );
      expect(uploadDescription, isNotNull);
      final byteData = createByteData(1024);

      final uploader = FileUploader(uploadDescription!);
      final result = await uploader.uploadByteData(byteData);

      expect(result, equals(true));

      final verified = await client.cloudStorage.verifyDirectFileUpload(
        'testdir/directupload.bin',
      );
      expect(verified, equals(true));
    });

    test('Retrieve directly uploaded file (ByteData)', () async {
      final byteData = await client.cloudStorage.retrievePublicFile(
        'testdir/directupload.bin',
      );
      expect(byteData!.lengthInBytes, equals(1024));
      expect(verifyByteData(byteData), equals(true));
    });

    test('Direct file upload (Stream<List<int>>)', () async {
      final uploadDescription = await client.cloudStorage.getDirectFilePostUrl(
        'testdir/directupload_stream_binary.bin',
      );
      expect(uploadDescription, isNotNull);

      final uploader = FileUploader(uploadDescription!);
      final result = await uploader.upload(
        streamBytes().take(512).inChunksOf(64),
      );

      expect(result, equals(true));

      final verified = await client.cloudStorage.verifyDirectFileUpload(
        'testdir/directupload_stream_binary.bin',
      );
      expect(verified, equals(true));

      final retrievedByteData = await client.cloudStorage.retrievePublicFile(
        'testdir/directupload_stream_binary.bin',
      );
      expect(retrievedByteData!.lengthInBytes, equals(512));
      expect(verifyByteData(retrievedByteData), equals(true));
    });

    test('Attempt to upload twice with the same FileUploader', () async {
      final uploadDescription = await client.cloudStorage.getDirectFilePostUrl(
        'testdir/directupload_duplicate.bin',
      );
      expect(uploadDescription, isNotNull);
      final byteData = createByteData(100);

      final uploader = FileUploader(uploadDescription!);
      final result = await uploader.uploadByteData(byteData);
      expect(result, equals(true));

      expect(
        () async => await uploader.uploadByteData(byteData),
        throwsA(
          isA<Exception>().having(
            (final e) => e.toString(),
            'message',
            contains('Data has already been uploaded using this FileUploader.'),
          ),
        ),
      );
    });
  });
}
