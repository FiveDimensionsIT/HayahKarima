import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class JoinTrainingRequest extends Serializable{
  String? programId;
  String? userId;
  String? requestDate;
  List<AvailableAppointmentModel?>? availableAppointments;
  List<RequiredPeriodModel?>? requiredPeriod;
  int? trainingTypeId;
  String? userNotes;

  JoinTrainingRequest({this.programId, this.userId, this.requestDate, this.availableAppointments, this.requiredPeriod, this.trainingTypeId, this.userNotes, });

  @override
  void fromMap(Map<String, dynamic> map) {
    programId = map['programId'];
    userId = map['userId'];
    requestDate = map['requestDate'];
    if (map['availableAppointments'] != null) {
      availableAppointments = [];
      map['availableAppointments'].forEach((v) {
        availableAppointments!.add((AvailableAppointmentModel()..fromMap(v)));
      });
    }
    if (map['requiredPeriod'] != null) {
      requiredPeriod = [];
      map['requiredPeriod'].forEach((v) {
        requiredPeriod!.add((RequiredPeriodModel()..fromMap(v)));
      });
    }
    trainingTypeId = map['trainingTypeId'];
    userNotes = map['userNotes'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['programId'] = this.programId;
    data['userId'] = this.userId;
    data['requestDate'] = this.requestDate;
    if (this.availableAppointments != null) {
      data['availableAppointments'] = this.availableAppointments!.map((v) => v?.toMap()).toList();
    }
    if (this.requiredPeriod != null) {
      data['requiredPeriod'] = this.requiredPeriod!.map((v) => v?.toMap()).toList();
    }
    data['trainingTypeId'] = this.trainingTypeId;
    data['userNotes'] = this.userNotes;
    return data;
  }
}

class AvailableAppointmentModel extends Serializable{
  String? day;
  String? timeFrom;
  String? timeTo;

  AvailableAppointmentModel({this.day, this.timeFrom, this.timeTo, });

  @override
  void fromMap(Map<String, dynamic> map) {
    day = map['day'];
    timeFrom = map['timeFrom'];
    timeTo = map['timeTo'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['timeFrom'] = this.timeFrom;
    data['timeTo'] = this.timeTo;
    return data;
  }
}

class RequiredPeriodModel extends Serializable{
  String? dateFrom;
  String? dateTo;

  RequiredPeriodModel({this.dateFrom, this.dateTo, });

  @override
  void fromMap(Map<String, dynamic> map) {
    dateFrom = map['dateFrom'];
    dateTo = map['dateTo'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateFrom'] = this.dateFrom;
    data['dateTo'] = this.dateTo;
    return data;
  }
}

