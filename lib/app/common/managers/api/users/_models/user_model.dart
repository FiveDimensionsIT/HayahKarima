import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserModel extends Serializable{
  int? id;
  String? name;

  UserModel({this.id, this.name, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

