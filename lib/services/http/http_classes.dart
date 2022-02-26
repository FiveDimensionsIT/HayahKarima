
import 'package:hayah_karema/utils/misc/generic_delegates.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';



enum HttpMethod { get, post, put, patch, delete }

class HttpRequest<T extends Serializable> {
  String url;
  Map<String, dynamic>? headers;
  HttpMethod method;
  T? data;

  HttpRequest(
      {required this.method, required this.url, this.headers, this.data});

  void addAuthBearerHeader(String bearer) {
    if (headers == null) headers = {};
    //
    this.headers!["Authorization"] = "Bearer $bearer";
  }

  void addJsonHeaders() {
    if (headers == null) headers = {};
    //
    this.headers!["Accept"] = "application/json";
    this.headers!["Content-Type"] = "application/json";
  }

  void addUrlEncodedHeader() {
    if (headers == null) headers = {};
    //
    this.headers!["Content-Type"] = "application/x-www-form-urlencoded";
  }
}

class HttpResponse {
  int? statusCode;
  String? statusMessage;
  String? data;

  HttpResponse({this.statusCode, this.statusMessage, this.data});
}

class HttpMonitor {
  Action1<HttpRequest> onRequest;
  Action1<HttpResponse> onResponse;

  HttpMonitor({required this.onRequest, required this.onResponse});
}

// exceptions



class ApiTimeoutException implements Exception{

  Object? originalException;

  ApiTimeoutException() : super();

}

class ApiResponseException implements Exception{

  final int statusCode;
  /// the message to display to the user
  final String message;

  /// the technical description of the error
  final String? description;

  Object? originalException;

  ApiResponseException(this.statusCode, this.message, {this.description});

  @override
  String toString() {
    return '(Api Exception) status:$statusCode\r msg:$message\r desc:\r$description';
  }

}
