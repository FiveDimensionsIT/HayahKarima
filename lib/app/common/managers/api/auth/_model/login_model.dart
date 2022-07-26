import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class LoginRequest extends Serializable{
  String? code;
  String? password;

  LoginRequest({this.code, this.password, });

  @override
  void fromMap(Map<String, dynamic> map) {
    code = map['code'];
    password = map['password'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['password'] = this.password;
    return data;
  }
}

class LoginResponse extends Serializable{
  String? token;

  LoginResponse({this.token});

  @override
  void fromMap(Map<String, dynamic> map) {
    token = map['accessToken'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.token;
    return data;
  }
}

