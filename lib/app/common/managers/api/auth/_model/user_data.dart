import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

// "governorateRequired": "true",
// "centerRequired": "false",
// "villageRequired": "false",

class UserData extends Serializable {
  String? id;
  String? email;
  String? name;
  String? fullName;
  String? idNumber;
  String? membershipCatId;
  String? villageId;
  String? centerId;
  String? governorateId;
  String? village;
  String? governorate;
  String? group;
  String? module;
  String? permissions;
  String? governorateRequired, centerRequired, villageRequired;
  int? exp;
  String? iss;
  String? aud;
  int langNo = 0;
  int? status;
  int? groupStatus;
  String? avatar;

  UserData(
      {this.id,
      this.email,
      this.name,
      this.governorate,
      this.fullName,
      this.idNumber,
      this.membershipCatId,
      this.governorateRequired,
      this.centerRequired,
      this.villageRequired,
      this.villageId,
      this.governorateId,
      this.centerId,
      this.village,
      this.group,
      this.module,
      this.permissions,
      this.exp,
      this.iss,
      this.aud,
      this.status,
      this.groupStatus,
      this.avatar});

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
    fullName = map['fullName'];
    idNumber = map['idNumber'];
    membershipCatId = map['membershipCatId'];
    villageId = map['villageId'];
    governorateId = map['governorateId'];
    centerId = map['centerId'];
    village = map['village'];
    group = map['group'];
    module = map['module'];
    permissions = map['permissions'];
    exp = map['exp'];
    governorateRequired = map['governorateRequired'];
    centerRequired = map['centerRequired'];
    villageRequired = map['villageRequired'];
    iss = map['iss'];
    groupStatus = map['groupStatus'];
    status = map['status'];
    aud = map['aud'];
    avatar = map['avatar'];
    governorate = map['governorate'];
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
    data['governorateId'] = this.governorateId;
    data['centerId'] = this.centerId;
    data['village'] = this.village;
    data['group'] = this.group;
    data['module'] = this.module;
    data['permissions'] = this.permissions;
    data['exp'] = this.exp;
    data['iss'] = this.iss;
    data['aud'] = this.aud;
    data['status'] = this.status;
    data['groupStatus'] = this.groupStatus;
    data['avatar'] = this.avatar;
    data['governorate'] = this.governorate;
    data['governorateRequired'] = this.governorateRequired;
    data['centerRequired'] = this.centerRequired;
    data['villageRequired'] = this.villageRequired;
    return data;
  }

  UserType get userRole => module == '1' ? UserType.admin : UserType.user;

  bool isUsersSideMenuItemVisible(){
    if(governorateRequired == 'true' || governorateRequired == '1') return true;
    if(centerRequired == 'true' || centerRequired == '1') return true;
    if(villageRequired == 'true' || villageRequired == '1') return true;
    return false;
  }

  bool myVillageVisibility() {
    return userRole == UserType.user && villageId!=null && villageId != '0';
  }
}
