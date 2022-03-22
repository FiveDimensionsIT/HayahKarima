import 'package:hayah_karema/app/common/managers/api/profile/_models/address.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/phone.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserProfile extends Serializable {
  UserProfile({
    this.id,
    this.fullName,
    this.contactTypeId,
    this.identificationNumber,
    this.email,
    this.biography,
    this.avatar,
    this.roles,
    this.phones,
    this.addresses,
    this.images,
    this.statusId,
  });

  int? id;
  String? fullName;
  int? contactTypeId;
  String? identificationNumber;
  String? email;
  dynamic biography;
  String? avatar;
  List<dynamic>? roles;
  List<Phone>? phones;
  List<Address>? addresses;
  List<dynamic>? images;
  int? statusId;


  @override
  void fromMap(Map<String, dynamic> map) {
    id= map["id"];
    fullName= map["fullName"];
    contactTypeId= map["contactTypeId"];
    identificationNumber= map["identificationNumber"];
    email= map["email"];
    biography= map["biography"];
    avatar= map["avatar"];
    roles= List<dynamic>.from(map["roles"].map((x) => x));
    ////
    phones= List<Phone>.from(map["phones"].map((x) => Phone));
    addresses= List<Address>.from(map["addresses"].map((x) => Address));
    images= List<dynamic>.from(map["images"].map((x) => x));
    statusId= map["statusId"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"]= id;
    data["fullName"]= fullName;
    data["contactTypeId"]= contactTypeId;
    data["identificationNumber"]= identificationNumber;
    data["email"]= email;
    data["biography"]= biography;
    data["avatar"]= avatar;
    data["roles"]= List<dynamic>.from(roles!.map((x) => x));
    data["phones"]= List<dynamic>.from(phones!.map((x) => x.toMap()));
    data["addresses"]=List<dynamic>.from(addresses!.map((x) => x.toMap()));
    data["images"]= List<dynamic>.from(images!.map((x) => x));
    data["statusId"] = statusId;
    return data;
  }
}



