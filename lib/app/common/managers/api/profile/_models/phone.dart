import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class Phone extends Serializable{
  Phone({
    this.id,
    this.number,
    this.whatsapp,
  });

  int? id;
  String? number;
  bool? whatsapp;

  @override
  void fromMap(Map<String, dynamic> map) {
    id= map["id"];
    number= map["number"];
    whatsapp= map["whatsapp"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"]= id;
    data["number"]= number;
    data["whatsapp"]= whatsapp;
    return data;
  }
}