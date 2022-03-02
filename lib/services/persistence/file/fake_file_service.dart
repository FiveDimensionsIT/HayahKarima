import 'dart:typed_data';

import '../file_lib.dart';


class FakeFileService implements IFileService {
  Map<String, dynamic> data = new Map();

  @override
  Future<void> deleteFile(String path) async {
    data.remove(path);
  }

  @override
  Future<bool> fileExists(String path) async {
    return data.containsKey(path);
  }

  @override
  Future<String> readFileString(String path) async {
    return data[path];
  }

  @override
  Future<void> saveFileString(String path, String content) async {
    data[path] = content;
  }

  @override
  Future<Uint8List> readFilebytes(String path) async {
    return data[path];
  }

  @override
  Future<void> saveFileBytes(String path, Uint8List content) async {
    data[path] = content;
  }
}
