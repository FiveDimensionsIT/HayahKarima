import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/user_status.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class PointerItemModel extends Serializable {
  int? id;
  String? fullName;
  String? nickname;
  String? mobile;
  String? barcode;
  String? name;
  String? avatar;
  String? governorate;
  String? email;
  String? center;
  String? village;
  String? excellenceField;
  String? deathDate;
  String? sponsorCategory;
  String? biography;
  String? type;
  String? identificationNumber;
  String? membershipCategory;
  int? indicator;
  int? villagesCount;
  String? status;
  String? villagePoints;
  String? villagePeople;
  RxString statusObs = ''.obs;

  PointerItemModel({
    this.id,
    this.fullName,
    this.nickname,
    this.mobile,
    this.barcode,
    this.name,
    this.avatar,
    this.email,
    this.governorate,
    this.center,
    this.village,
    this.excellenceField,
    this.deathDate,
    this.sponsorCategory,
    this.biography,
    this.type,
    this.identificationNumber,
    this.membershipCategory,
    this.indicator,
    this.status,
    this.villagesCount,
    this.villagePoints,
    this.villagePeople,
  });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    barcode = map['barcode'];
    nickname = map['nickname'];
    mobile = map['mobile'];
    fullName = map['fullName'];
    name = map['name'];
    avatar = map['avatar'];
    governorate = map['governorate'];
    email = map['email'];
    center = map['center'];
    village = map['village'];
    excellenceField = map['excellenceField'];
    deathDate = map['deathDate'];
    sponsorCategory = map['sponsorCategory'];
    biography = map['biography'];
    type = map['type'];
    identificationNumber = map['identificationNumber'];
    membershipCategory = map['membershipCategory'];
    indicator = map['indicator'];
    status = map['status'];
    // status = 'مجمد';
    // status = 'قيد الاعتماد';
    villagesCount = map['villagesCount'];
    villagesCount = map['villagesCount'];
    villagePoints = map['villagePoints'] != null ?  formatter.format(map['villagePoints']) : '';
    villagePeople = map['villagePeople'] != null ?  formatter.format(map['villagePeople']) : '';
    statusObs.value = (status == null)? '' : status!;
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['barcode'] = this.barcode;
    data['nickname'] = this.nickname;
    data['fullName'] = this.fullName;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['governorate'] = this.governorate;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['center'] = this.center;
    data['village'] = this.village;
    data['excellenceField'] = this.excellenceField;
    data['deathDate'] = this.deathDate;
    data['sponsorCategory'] = this.sponsorCategory;
    data['biography'] = this.biography;
    data['type'] = this.type;
    data['identificationNumber'] = this.identificationNumber;
    data['membershipCategory'] = this.membershipCategory;
    data['indicator'] = this.indicator;
    data['status'] = this.status;
    data['villagesCount'] = this.villagesCount;
    // data['villagePoints'] = this.villagePoints;
    // data['villagePeople'] = this.villagePeople;
    return data;
  }

  double percentage(int maxIndicator) => indicator! / maxIndicator;

  String? get userName => name ?? fullName ?? '';

  UserStatus getUserStatus(){
    if(status == 'معتمد') return UserStatus.CERTIFIED;
    if(status == 'مجمد') return UserStatus.FREZED;
    return UserStatus.PENDING;
  }


}
