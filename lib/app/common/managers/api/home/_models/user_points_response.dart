import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserPointsResponse extends Serializable{
  int? total_points;
  int? exchanged_points;
  int? available_points;

  UserPointsResponse({this.total_points, this.exchanged_points, this.available_points, });

  @override
  void fromMap(Map<String, dynamic> map) {
    total_points = map['total_points'];
    exchanged_points = map['exchanged_points'];
    available_points = map['available_points'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_points'] = this.total_points;
    data['exchanged_points'] = this.exchanged_points;
    data['available_points'] = this.available_points;
    return data;
  }
}

