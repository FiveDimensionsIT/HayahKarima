import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class AddUserData extends Serializable{
  String? fullName;
  String? nickname;
  String? identificationNumber;
  int? genderId;
  int? healthStatusId;
  int? educationalStatusId;
  int? citizenGovernorateId;
  int? citizenCenterId;
  int? citizenVillageId;
  IdImageFront? idImageFront;
  IdImageBack? idImageBack;
  List<Phones?>? phones;
  String? creatorGroupId;
  String? createdBy;

  AddUserData({this.fullName, this.nickname, this.identificationNumber, this.genderId, this.healthStatusId, this.educationalStatusId, this.citizenGovernorateId, this.citizenCenterId, this.citizenVillageId, this.idImageFront, this.idImageBack, this.phones, this.creatorGroupId, this.createdBy, });

  @override
  void fromMap(Map<String, dynamic> map) {
    fullName = map['fullName'];
    nickname = map['nickname'];
    identificationNumber = map['identificationNumber'];
    genderId = map['genderId'];
    healthStatusId = map['healthStatusId'];
    educationalStatusId = map['educationalStatusId'];
    citizenGovernorateId = map['citizenGovernorateId'];
    citizenCenterId = map['citizenCenterId'];
    citizenVillageId = map['citizenVillageId'];
    idImageFront = map['idImageFront'] != null ? (IdImageFront()..fromMap(map['idImageFront'])) : null;
    idImageBack = map['idImageBack'] != null ? (IdImageBack()..fromMap(map['idImageBack'])) : null;
    if (map['phones'] != null) {
      phones = [];
      map['phones'].forEach((v) {
        phones!.add((Phones()..fromMap(v)));
      });
    }
    creatorGroupId = map['creatorGroupId'];
    createdBy = map['createdBy'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['nickname'] = this.nickname;
    data['identificationNumber'] = this.identificationNumber;
    data['genderId'] = this.genderId;
    data['healthStatusId'] = this.healthStatusId;
    data['educationalStatusId'] = this.educationalStatusId;
    data['citizenGovernorateId'] = this.citizenGovernorateId;
    data['citizenCenterId'] = this.citizenCenterId;
    data['citizenVillageId'] = this.citizenVillageId;
    if (this.idImageFront != null) {
      data['idImageFront'] = this.idImageFront!.toMap();
    }
    if (this.idImageBack != null) {
      data['idImageBack'] = this.idImageBack!.toMap();
    }
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v?.toMap()).toList();
    }
    data['creatorGroupId'] = this.creatorGroupId;
    data['createdBy'] = this.createdBy;
    return data;
  }
}

class IdImageFront extends Serializable{
  String? filename;
  String? base64;

  IdImageFront({this.filename, this.base64, });

  @override
  void fromMap(Map<String, dynamic> map) {
    filename = map['filename'];
    base64 = map['base64'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['base64'] = this.base64;
    return data;
  }
}

class IdImageBack extends Serializable{
  String? filename;
  String? base64;

  IdImageBack({this.filename, this.base64, });

  @override
  void fromMap(Map<String, dynamic> map) {
    filename = map['filename'];
    base64 = map['base64'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['base64'] = this.base64;
    return data;
  }
}

class Phones extends Serializable{
  String? number;
  bool? whatsapp;

  Phones({this.number, this.whatsapp, });

  @override
  void fromMap(Map<String, dynamic> map) {
    number = map['number'];
    whatsapp = map['whatsapp'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}

