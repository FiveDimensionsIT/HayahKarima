import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class RegisterUserResponse extends Serializable{
  String? code;
  String? message;

  RegisterUserResponse({this.code, this.message, });

  @override
  void fromMap(Map<String, dynamic> map) {
    code = map['code'];
    message = map['message'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

