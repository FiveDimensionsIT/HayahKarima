import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class LoginRequest extends Serializable{
  String? email;
  String? password;

  LoginRequest({this.email, this.password, });

  @override
  void fromMap(Map<String, dynamic> map) {
    email = map['email'];
    password = map['password'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class LoginResponse extends Serializable{
  String? token;
  int? status;
  int? groupStatus;

  LoginResponse({this.token, this.status, this.groupStatus, });

  @override
  void fromMap(Map<String, dynamic> map) {
    token = map['token'];
    status = map['status'];
    groupStatus = map['groupStatus'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['status'] = this.status;
    data['groupStatus'] = this.groupStatus;
    return data;
  }
}

