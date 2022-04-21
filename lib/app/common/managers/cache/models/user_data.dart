

import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class UserData extends Serializable {
  int? userId;
  String? userName;
  int? userDataId;
  int? userTypeId;
  int? langNo;
  String? userPhase;
  String? imageUrl;
  String? className;
  int? userAcademicYearId;
  bool? userAcademicYearIdIsOpen;

  UserData({
    this.userId,
    this.userName,
    this.userDataId,
    this.userTypeId,
    this.langNo,
    this.userPhase,
    this.imageUrl,
    this.className,
    this.userAcademicYearId,
    this.userAcademicYearIdIsOpen,
  });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    userName = map['userName'];
    userDataId = map['userDataId'];
    userTypeId = map['userTypeId'];
    langNo = map['langNo'];
    imageUrl = map['imageUrl'];
    className = map['className'];
    userPhase = map['userPhase'];
    userAcademicYearId = map['userAcademicYearId'];
    userAcademicYearIdIsOpen = map['userAcademicYearIdIsOpen'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userDataId'] = this.userDataId;
    data['userTypeId'] = this.userTypeId;
    data['langNo'] = this.langNo;
    data['userPhase'] = this.userPhase;
    data['imageUrl'] = this.imageUrl;
    data['className'] = this.className;
    data['userAcademicYearId'] = this.userAcademicYearId;
    data['userAcademicYearIdIsOpen'] = this.userAcademicYearIdIsOpen;
    return data;
  }

  UserType get userType => UserType.values[userTypeId! - 1];

  String get langCode => langNo == 1 ? 'ar' : 'en';
}
