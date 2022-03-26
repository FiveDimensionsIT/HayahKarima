import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class MyVillageModel extends Serializable{
  int? id;
  int? code;
  String? barcode;
  String? name;
  int? parentId;
  String? center;
  String? governorate;
  int? villageTypeId;
  int? population;
  String? lang;
  String? lat;
  bool? haya_karima;
  String? description;
  int? indicator;
  int? statusId;
  List<GalleryModel>? images;

  MyVillageModel({this.id, this.images, this.code, this.barcode, this.name, this.parentId, this.center, this.governorate, this.villageTypeId, this.population, this.lang, this.lat, this.haya_karima, this.description, this.indicator, this.statusId, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    code = map['code'];
    barcode = map['barcode'];
    name = map['name'];
    parentId = map['parentId'];
    center = map['center'];
    governorate = map['governorate'];
    villageTypeId = map['villageTypeId'];
    population = map['population'];
    lang = map['lang'];
    lat = map['lat'];
    haya_karima = map['haya_karima'];
    description = map['description'];
    indicator = map['indicator'];
    statusId = map['statusId'];
    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add((GalleryModel()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['center'] = this.center;
    data['governorate'] = this.governorate;
    data['villageTypeId'] = this.villageTypeId;
    data['population'] = this.population;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['haya_karima'] = this.haya_karima;
    data['description'] = this.description;
    data['indicator'] = this.indicator;
    data['statusId'] = this.statusId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}


