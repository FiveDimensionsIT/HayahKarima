import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class RegisterCourseRequest extends Serializable{
  int? courseId;
  String? userId;
  String? registrationDate;

  RegisterCourseRequest({this.courseId, this.userId, this.registrationDate, });

  @override
  void fromMap(Map<String, dynamic> map) {
    courseId = map['courseId'];
    userId = map['userId'];
    registrationDate = map['registrationDate'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['userId'] = this.userId;
    data['registrationDate'] = this.registrationDate;
    return data;
  }
}


