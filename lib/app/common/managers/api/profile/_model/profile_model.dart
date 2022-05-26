import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class ProfileModel extends Serializable{
  int? id;
  String? fullName;
  int? contactTypeId;
  String? identificationNumber;
  String? email;
  Object? biography;
  String? avatar;
  String? governorate;
  String? center;
  String? village;
  Object? sponsorCategory;
  String? membershipCategory;
  Object? excellenceField;
  String? martyrDeathDate;
  List<Object?>? roles;
  List<Phones?>? phones;
  List<Addresses?>? addresses;
  List<Object?>? images;
  int? statusId;

  ProfileModel({this.id, this.fullName, this.contactTypeId, this.identificationNumber, this.email, this.biography, this.avatar, this.governorate, this.center, this.village, this.sponsorCategory, this.membershipCategory, this.excellenceField, this.martyrDeathDate, this.roles, this.phones, this.addresses, this.images, this.statusId, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullName = map['fullName'];
    contactTypeId = map['contactTypeId'];
    identificationNumber = map['identificationNumber'];
    email = map['email'];
    biography = map['biography'];
    avatar = map['avatar'];
    governorate = map['governorate'];
    center = map['center'];
    village = map['village'];
    sponsorCategory = map['sponsorCategory'];
    membershipCategory = map['membershipCategory'];
    excellenceField = map['excellenceField'];
    martyrDeathDate = map['martyrDeathDate'];
    if (map['roles'] != null) {
      roles = [];
      map['roles'].forEach((v) {
        roles!.add(v);
      });
    }
    if (map['phones'] != null) {
      phones = [];
      map['phones'].forEach((v) {
        phones!.add((Phones()..fromMap(v)));
      });
    }
    if (map['addresses'] != null) {
      addresses = [];
      map['addresses'].forEach((v) {
        addresses!.add((Addresses()..fromMap(v)));
      });
    }
    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add(v);
      });
    }
    statusId = map['statusId'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['contactTypeId'] = this.contactTypeId;
    data['identificationNumber'] = this.identificationNumber;
    data['email'] = this.email;
    data['biography'] = this.biography;
    data['avatar'] = this.avatar;
    data['governorate'] = this.governorate;
    data['center'] = this.center;
    data['village'] = this.village;
    data['sponsorCategory'] = this.sponsorCategory;
    data['membershipCategory'] = this.membershipCategory;
    data['excellenceField'] = this.excellenceField;
    data['martyrDeathDate'] = this.martyrDeathDate;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v).toList();
    }
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v?.toMap()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v?.toMap()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v).toList();
    }
    data['statusId'] = this.statusId;
    return data;
  }
}

class Phones extends Serializable{
  int? id;
  String? number;
  bool? whatsapp;

  Phones({this.id, this.number, this.whatsapp, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    number = map['number'];
    whatsapp = map['whatsapp'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}

class Addresses extends Serializable{
  int? id;
  int? countryId;
  int? governorateId;
  int? centerId;
  int? villageId;
  String? address;
  bool? isMain;

  Addresses({this.id, this.countryId, this.governorateId, this.centerId, this.villageId, this.address, this.isMain, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    countryId = map['countryId'];
    governorateId = map['governorateId'];
    centerId = map['centerId'];
    villageId = map['villageId'];
    address = map['address'];
    isMain = map['isMain'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['countryId'] = this.countryId;
    data['governorateId'] = this.governorateId;
    data['centerId'] = this.centerId;
    data['villageId'] = this.villageId;
    data['address'] = this.address;
    data['isMain'] = this.isMain;
    return data;
  }
}

