import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class Address extends Serializable {
  Address({
    this.id,
    this.countryId,
    this.governorateId,
    this.centerId,
    this.villageId,
    this.address,
    this.isMain,
  });

  int? id;
  int? countryId;
  int? governorateId;
  int? centerId;
  int? villageId;
  String? address;
  bool? isMain;


  @override
  void fromMap(Map<String, dynamic> map) {
    id= map["id"];
    countryId= map["countryId"];
    governorateId= map["governorateId"];
    centerId= map["centerId"];
    villageId= map["villageId"];
    address= map["address"];
    isMain= map["isMain"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"]= id;
    data["countryId"]= countryId;
    data["governorateId"]= governorateId;
    data["centerId"]= centerId;
    data["villageId"]= villageId;
    data["address"]= address;
    data["isMain"] = isMain;
    return data;
  }
}