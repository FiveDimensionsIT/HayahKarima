import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserStatusRequest extends Serializable{
  int? id;
  int? statusId;

  UserStatusRequest({this.id, this.statusId, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    statusId = map['statusId'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statusId'] = this.statusId;
    return data;
  }
}

