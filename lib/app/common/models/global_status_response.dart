import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class GlobalStatusResponse extends Serializable{
  String? statusId;
  String? message;
  int? id;
  String? statusName;

  GlobalStatusResponse({this.statusId, this.message, this.id, this.statusName});

  @override
  void fromMap(Map<String, dynamic> map) {
    statusId = map['statusId'];
    message = map['message'];
    id = map['id'];
    statusName = map['statusName'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusId'] = this.statusId;
    data['message'] = this.message;
    data['id'] = this.id;
    data['statusName'] = this.statusName;
    return data;
  }
}