import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class MartyrsPrayersRequest extends Serializable{
  String? userId;
  String? martyrId;
  String? points;
  String? date;

  MartyrsPrayersRequest({this.userId, this.martyrId, this.points, this.date, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    martyrId = map['martyrId'];
    points = map['points'];
    date = map['date'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['martyrId'] = this.martyrId;
    data['points'] = this.points;
    data['date'] = this.date;
    return data;
  }
}

