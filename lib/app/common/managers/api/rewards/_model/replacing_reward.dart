import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class ReplacingReward extends Serializable{
  String? userId;
  int? rewardId;
  int? points;
  String? date;

  ReplacingReward({this.userId, this.rewardId, this.points, this.date, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    rewardId = map['rewardId'];
    points = map['points'];
    date = map['date'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['rewardId'] = this.rewardId;
    data['points'] = this.points;
    data['date'] = this.date;
    return data;
  }
}

