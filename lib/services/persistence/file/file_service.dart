import 'dart:io';
import 'dart:typed_data';

import '../file_lib.dart';

/// for IOS, you need to use getApplicationDocumentsDirectoryfrom path_provider
/// and add permissions on info.plist to make the folder visible to the user:
// <key>LSSupportsOpeningDocumentsInPlace</key>
// <true/>
// <key>UIFileSharingEnabled</key>
// <true/>
///
class FileService implements IFileService {
  @override
  Future<bool> fileExists(String path) {
    return File(path).exists();
  }

  @override
  Future<String> readFileString(String path) {
    var file = File(path);
    return file.readAsString();
  }

  @override

  /// created the containing folder and file is doesn't exist
  Future<void> saveFileString(String path, String content) async {
    var file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsString(content);
  }

  @override
  Future<void> deleteFile(String path) async {
    await File(path).delete();
  }

  @override
  Future<Uint8List> readFilebytes(String path) {
    var file = File(path);
    return file.readAsBytes();
  }

  @override
  Future<void> saveFileBytes(String path, Uint8List content) async {
    var file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(content);
  }
}
