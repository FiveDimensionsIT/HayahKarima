import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserData extends Serializable{
  String? id;
  String? email;
  String? name;
  String? fullName;
  String? idNumber;
  String? membershipCatId;
  String? villageId;
  String? village;
  String? group;
  String? module;
  String? permissions;
  int? exp;
  String? iss;
  String? aud;
  int langNo = 0;

  UserData({this.id, this.email, this.name, this.fullName, this.idNumber, this.membershipCatId, this.villageId, this.village, this.group, this.module, this.permissions, this.exp, this.iss, this.aud, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
    fullName = map['fullName'];
    idNumber = map['idNumber'];
    membershipCatId = map['membershipCatId'];
    villageId = map['villageId'];
    village = map['village'];
    group = map['group'];
    module = map['module'];
    permissions = map['permissions'];
    exp = map['exp'];
    iss = map['iss'];
    aud = map['aud'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['idNumber'] = this.idNumber;
    data['membershipCatId'] = this.membershipCatId;
    data['villageId'] = this.villageId;
    data['village'] = this.village;
    data['group'] = this.group;
    data['module'] = this.module;
    data['permissions'] = this.permissions;
    data['exp'] = this.exp;
    data['iss'] = this.iss;
    data['aud'] = this.aud;
    return data;
  }

  UserType get userRole => module == '2' ? UserType.admin:UserType.user;
}

