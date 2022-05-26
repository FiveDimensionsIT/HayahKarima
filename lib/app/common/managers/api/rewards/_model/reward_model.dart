import 'package:get/get.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class RewardModel extends Serializable{
  int? id;
  String? name;
  int? requiredPoints;
  String? sponsor;
  String? avatar;
  String? status;
  RxBool isReplacingBtnLoading = false.obs;

  RewardModel({this.id, this.name, this.requiredPoints, this.sponsor, this.avatar, this.status, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    requiredPoints = map['requiredPoints'];
    sponsor = map['sponsor'];
    avatar = map['avatar'];
    status = map['status'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['requiredPoints'] = this.requiredPoints;
    data['sponsor'] = this.sponsor;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    return data;
  }
}

