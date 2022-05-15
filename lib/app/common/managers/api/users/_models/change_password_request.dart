import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class ChangePasswordRequest extends Serializable{
  int? contactId;
  String? password;

  ChangePasswordRequest({this.contactId, this.password, });

  @override
  void fromMap(Map<String, dynamic> map) {
    contactId = map['contactId'];
    password = map['password'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactId'] = this.contactId;
    data['password'] = this.password;
    return data;
  }
}

