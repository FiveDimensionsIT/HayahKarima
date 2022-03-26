import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class PostTypeModel extends Serializable{
  int? id;
  String? name;
  int? points;

  PostTypeModel({this.id, this.name, this.points, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    points = map['points'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['points'] = this.points;
    return data;
  }
}

