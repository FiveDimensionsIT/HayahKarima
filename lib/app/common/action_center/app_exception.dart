

class AppException implements Exception{

  /// the message to display to the user
  final String message;

  /// the technical description of the error
  final String? description;

  Object? originalException;

  AppException(this.message, {this.description});

  @override
  String toString() {
    return '(AppException) msg:$message desc:$description';
  }

}
