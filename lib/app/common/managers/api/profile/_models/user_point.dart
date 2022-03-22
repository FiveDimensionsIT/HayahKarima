import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserPoint extends Serializable {
  UserPoint({
    this.totalPoints,
    this.exchangedPoints,
    this.availablePoints,
  });

  int? totalPoints;
  int? exchangedPoints;
  int? availablePoints;

  @override
  void fromMap(Map<String, dynamic> map) {
    totalPoints = map["total_points"];
    exchangedPoints= map["exchanged_points"];
    availablePoints= map["available_points"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["total_points"]= totalPoints;
    data["exchanged_points"]= exchangedPoints;
    data["available_points"]= availablePoints;
    return data;
  }
}
