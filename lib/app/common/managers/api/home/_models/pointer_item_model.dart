import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class PointerItemModel extends Serializable {
  int? id;
  String? fullName;
  String? name;
  String? avatar;
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

  PointerItemModel({
    this.id,
    this.fullName,
    this.name,
    this.avatar,
    this.email,
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
  });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullName = map['fullName'];
    name = map['name'];
    avatar = map['avatar'];
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
    villagesCount = map['villagesCount'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['name'] = this.name;
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
    return data;
  }

  double percentage(int maxIndicator) => indicator! / maxIndicator;

  String? get userName => name ?? fullName ?? '';
}
