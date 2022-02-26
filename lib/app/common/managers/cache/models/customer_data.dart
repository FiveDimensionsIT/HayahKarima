import 'package:hayah_karema/utils/serialization/serialization_lib.dart';


class CustomerData extends Serializable {
  int? schoolId;
  String? logoUrl;
  String? serviceUrl;
  String? companyCode;
  String? schoolName1;
  String? schoolName2;
  String? schoolSubdomain;
  int? currentAcademicYearId;
  int? currentAcademicYear;
  bool? currentAcademicYearIsOpen;

  CustomerData(
      {this.schoolId,
      this.logoUrl,
      this.serviceUrl,
      this.companyCode,
      this.schoolName1,
      this.schoolName2,
      this.schoolSubdomain,
      this.currentAcademicYearId,
      this.currentAcademicYear,
      this.currentAcademicYearIsOpen});

  @override
  void fromMap(Map<String, dynamic> map) {
    schoolId = map['schoolId'];
    logoUrl = map['logoUrl'];
    serviceUrl = map['serviceUrl'];
    companyCode = map['companyCode'];
    schoolName1 = map['schoolName1'];
    schoolName2 = map['schoolName2'];
    schoolSubdomain = map['schoolSubdomain'];
    currentAcademicYearId = map['currentAcademicYearId'];
    currentAcademicYear = map['currentAcademicYear'];
    currentAcademicYearIsOpen = map['currentAcademicYearIsOpen'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolId'] = this.schoolId;
    data['logoUrl'] = this.logoUrl;
    data['serviceUrl'] = this.serviceUrl;
    data['companyCode'] = this.companyCode;
    data['schoolName1'] = this.schoolName1;
    data['schoolName2'] = this.schoolName2;
    data['schoolSubdomain'] = this.schoolSubdomain;
    data['currentAcademicYearId'] = this.currentAcademicYearId;
    data['currentAcademicYear'] = this.currentAcademicYear;
    data['currentAcademicYearIsOpen'] = this.currentAcademicYearIsOpen;
    return data;
  }
}
