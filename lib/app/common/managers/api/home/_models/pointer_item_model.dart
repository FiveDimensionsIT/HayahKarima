import 'package:hayah_karema/utils/serialization/serialization_lib.dart';
import 'package:intl/intl.dart';



class PointerItemModel extends Serializable{
  int? id;
  var code;
  String? name;
  String? country;
  String? governorate;
  String? lang;
  String? lat;
  int? indicator;
  int? villagesCount;
  String? status;
  int? statusId;

  PointerItemModel({this.id, this.code, this.name, this.country, this.governorate, this.lang, this.lat, this.indicator, this.villagesCount, this.status, this.statusId, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    code = map['code'];
    name = map['name'];
    country = map['country'];
    governorate = map['governorate'];
    lang = map['lang'];
    lat = map['lat'];
    indicator = map['indicator']??0;
    villagesCount = map['villagesCount'];
    status = map['status'];
    statusId = map['statusId'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['country'] = this.country;
    data['governorate'] = this.governorate;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['indicator'] = this.indicator;
    data['villagesCount'] = this.villagesCount;
    data['status'] = this.status;
    data['statusId'] = this.statusId;
    return data;
  }

  double percentage(int maxIndicator) => indicator!/maxIndicator;
}

