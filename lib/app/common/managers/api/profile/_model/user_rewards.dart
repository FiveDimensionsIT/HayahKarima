import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserRewards extends Serializable {

  UserRewards({this.reward, this.avatar, this.date, this.points,});

  String? reward;
  String? avatar;
  String? date;
  int? points;

  @override
  void fromMap(Map<String, dynamic> map) {
    reward = map['reward'];
    avatar = map['avatar'];
    points = map['points'];
    date =  map['date'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reward'] = this.reward;
    data['avatar'] = this.avatar;
    data['points'] = this.points;
    data['date'] = this.date;
    return data;
  }

}


