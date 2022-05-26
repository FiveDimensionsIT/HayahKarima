import 'package:hayah_karema/utils/DateHelper.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class AvailableCourseModel extends Serializable{
  int? id;
  String? program;
  String? barcode;
  String? dateFrom;
  String? dateTo;
  int? noOfMinutesPerDay;
  String? trainingPlace;
  String? status;
  List<Dates?>? dates;

  AvailableCourseModel({this.id, this.program, this.barcode, this.dateFrom, this.dateTo, this.noOfMinutesPerDay, this.trainingPlace, this.status, this.dates, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    program = map['program'];
    barcode = map['barcode'];
    dateFrom = map['dateFrom'];
    dateTo = map['dateTo'];
    noOfMinutesPerDay = map['noOfMinutesPerDay'];
    trainingPlace = map['trainingPlace'];
    status = map['status'];
    if (map['dates'] != null) {
      dates = [];
      map['dates'].forEach((v) {
        dates!.add((Dates()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['program'] = this.program;
    data['barcode'] = this.barcode;
    data['dateFrom'] = this.dateFrom;
    data['dateTo'] = this.dateTo;
    data['noOfMinutesPerDay'] = this.noOfMinutesPerDay;
    data['trainingPlace'] = this.trainingPlace;
    data['status'] = this.status;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v?.toMap()).toList();
    }
    return data;
  }

  double get noOfHoursPerDay => noOfMinutesPerDay!/60;
}

class Dates extends Serializable{
  String? day;
  String? date;
  String? timeFrom;
  String? timeTo;
  bool? isSelected;
  late String dateId;

  Dates({this.day, this.date, this.timeFrom, this.timeTo, this.isSelected});

  @override
  void fromMap(Map<String, dynamic> map) {
    day = map['day'];
    date = map['date'];
    timeFrom = map['timeFrom'];
    timeTo = map['timeTo'];
    isSelected = false;
    dateId = '${formatDateToDay(date??'')}T$timeTo';
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['date'] = this.date;
    data['timeFrom'] = this.timeFrom;
    data['timeTo'] = this.timeTo;
    return data;
  }
}

