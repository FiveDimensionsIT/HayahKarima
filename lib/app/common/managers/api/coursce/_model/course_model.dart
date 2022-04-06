import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

// class CourseModel extends Serializable{
//   CourseModel({
//     this.id,
//     this.name,
//     this.noOfHours,
//     this.lectureDurationInMinutes,
//     this.category,
//     this.goals,
//     this.images,
//     this.outlines,
//   });
//
//   int? id;
//   String? name;
//   int? noOfHours;
//   int? lectureDurationInMinutes;
//   String? category;
//   List<Goal>? goals;
//   List<Image>? images;
//   List<Outline>? outlines;
//
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     id= map["id"];
//     name= map["name"];
//     noOfHours = map["no_of_hours"];
//     lectureDurationInMinutes = map["lecture_duration_in_minutes"];
//     category = map["category"];
//
//     if (map['goals'] != null) {
//     goals = [];
//     map['goals'].forEach((v) {
//     goals!.add(v);
//     });
//     }
//
//     if (map['images'] != null) {
//     images = [];
//     map['images'].forEach((v) {
//     images!.add(v);
//     });
//     }
//
//     if (map['outlines'] != null) {
//     outlines = [];
//     map['outlines'].forEach((v) {
//     outlines!.add(v);
//     });
//     }
//   }
//
//   @override
//   Map<String, dynamic> toMap(){
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name']=this.name;
//     data['no_of_hours']=this.noOfHours;
//     data['lecture_duration_in_minutes'] = this.lectureDurationInMinutes;
//     data['category'] = this.category;
//
//     if (this.goals != null) {
//     data['goals'] = this.goals!.map((v) => v).toList();
//     }
//
//     if (this.images != null) {
//     data['images'] = this.images!.map((v) => v).toList();
//     }
//
//     if (this.outlines != null) {
//     data['outlines'] = this.outlines!.map((v) => v).toList();
//     }
//     return data;
//   }
//
//
// }
//
// class Goal extends Serializable {
//   Goal({
//     this.id,
//     this.goal,
//   });
//
//   int? id;
//   String? goal;
//
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     id= map["id"];
//     goal = map["goal"];
//   }
//
//   @override
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['goal']=this.goal;
//     return data;
//   }
// }
//
// class Image extends Serializable{
//   Image({
//     this.id,
//     this.filename,
//     this.caption,
//   });
//
//   int? id;
//   String? filename;
//   dynamic? caption;
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     id= map["id"];
//     filename = map["filename"];
//     caption = map["caption"];
//   }
//
//   @override
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['filename'] = this.filename;
//     data['caption'] = this.caption;
//
//     return data;
//   }
//
// }
//
// class Outline extends Serializable {
//   Outline({
//     this.id,
//     this.title,
//     this.details,
//   });
//
//   int? id;
//   String? title;
//   List<Details>? details;
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     id = map["id"];
//     title = map["title"];
//     if (map['details'] != null) {
//       details = [];
//       map['details'].forEach((v) {
//         details!.add(v);
//       });
//     }
//   }
//
//   @override
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['id'] = this.id;
//     data['title'] = this.title;
//     if (this.details != null) {
//       data['details'] = this.details!.map((v) => v).toList();
//     }
//     return data;
//   }
//
// }
//
// class Details extends Serializable {
//   Details({
//     this.description,
//   });
//
//   String? description;
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     description = map["description"];
//   }
//
//   @override
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['description'] = this.description;
//     return data;
//   }
//
//
// }
class CourseModel extends Serializable{
  int? id;
  String? name;
  int? no_of_hours;
  int? lecture_duration_in_minutes;
  String? category;
  List<Goals?>? goals;
  List<Images?>? images;
  List<Outlines?>? outlines;

  CourseModel({this.id, this.name, this.no_of_hours, this.lecture_duration_in_minutes, this.category, this.goals, this.images, this.outlines, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    no_of_hours = map['no_of_hours'];
    lecture_duration_in_minutes = map['lecture_duration_in_minutes'];
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
    data['no_of_hours'] = this.no_of_hours;
    data['lecture_duration_in_minutes'] = this.lecture_duration_in_minutes;
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