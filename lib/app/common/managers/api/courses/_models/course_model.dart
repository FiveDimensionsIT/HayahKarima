import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class TrainingCourseModel extends Serializable{
  int? id;
  String? name;
  int? noOfHours;
  int? lectureDurationInMinutes;
  String? category;
  List<Goals?>? goals;
  List<Images?>? images;
  List<Outlines?>? outlines;

  TrainingCourseModel({this.id, this.name, this.noOfHours, this.lectureDurationInMinutes, this.category, this.goals, this.images, this.outlines, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    noOfHours = map['noOfHours'];
    lectureDurationInMinutes = map['lectureDurationInMinutes'];
    category = map['category'];
    if (map['goals'] != null) {
      goals = [];
      map['goals'].forEach((v) {
        goals!.add((Goals()..fromMap(v)));
      });
    }
    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add((Images()..fromMap(v)));
      });
    }
    if (map['outlines'] != null) {
      outlines = [];
      map['outlines'].forEach((v) {
        outlines!.add((Outlines()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['noOfHours'] = this.noOfHours;
    data['lectureDurationInMinutes'] = this.lectureDurationInMinutes;
    data['category'] = this.category;
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v?.toMap()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v?.toMap()).toList();
    }
    if (this.outlines != null) {
      data['outlines'] = this.outlines!.map((v) => v?.toMap()).toList();
    }
    return data;
  }
}

class Goals extends Serializable{
  int? id;
  String? goal;

  Goals({this.id, this.goal, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    goal = map['goal'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal'] = this.goal;
    return data;
  }
}

class Images extends Serializable{
  int? id;
  String? filename;
  Object? caption;

  Images({this.id, this.filename, this.caption, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    filename = map['filename'];
    caption = map['caption'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['caption'] = this.caption;
    return data;
  }
}

class Outlines extends Serializable{
  int? id;
  String? title;
  List<Details?>? details;

  Outlines({this.id, this.title, this.details, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    if (map['details'] != null) {
      details = [];
      map['details'].forEach((v) {
        details!.add((Details()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v?.toMap()).toList();
    }
    return data;
  }
}

class Details extends Serializable{
  String? description;

  Details({this.description, });

  @override
  void fromMap(Map<String, dynamic> map) {
    description = map['description'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}

