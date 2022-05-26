import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class LookupModel extends Serializable{
  int? id;
  String? name;

  LookupModel({this.id, this.name, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

