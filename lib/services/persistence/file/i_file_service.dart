import 'dart:typed_data';

abstract class IFileService {
  Future<String> readFileString(String path);

  Future<void> saveFileString(String path, String content);

  Future<Uint8List> readFilebytes(String path);

  Future<void> saveFileBytes(String path, Uint8List content);

  Future<bool> fileExists(String path);

  Future<void> deleteFile(String path);
}
