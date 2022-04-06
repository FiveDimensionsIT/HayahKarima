import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserEarnedPointModel extends Serializable {

  String? code;
  String? name;
  int? points;
  String? date;

  UserEarnedPointModel({this.code, this.name, this.points, this.date });

  @override
  void fromMap(Map<String, dynamic> map) {
    code = map['code'];
    name = map['name'];
    points = map['points'];
    date =  map['date'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['points'] = this.points;
    data['date'] = this.date;
    return data;
  }
}
