import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class ProductDetailsModel extends Serializable{
  int? id;
  String? name;
  String? description;

  List<Reviews?>? reviews;
  List<Images?>? images;


  ProductDetailsModel({this.id, this.name, this.description, this.images, this.reviews });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];

    if (map['reviews'] != null) {
      reviews = [];
      map['reviews'].forEach((v) {
        reviews!.add((Reviews()..fromMap(v)));
      });
    }

    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add((Images()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;

    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v?.toMap()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v?.toMap()).toList();
    }
    return data;
  }
}

class Images extends Serializable {
  String? filename;
  String? title;

  Images({this.filename, this.title});

  // Images.fromJson(Map<String, dynamic> json) {
  //   filename = json['filename'];
  //   title = json['title'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['filename'] = this.filename;
  //   data['title'] = this.title;
  //   return data;
  // }

  @override
  void fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    filename = map['filename'];
    title = map['title'];
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['filename'] = filename;
    data['title'] = title;
    return data;
  }
}

// class Images extends Serializable{
//   String? filename;
//   String? title;
//
//   Images({this.filename, this.title});
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     // TODO: implement fromMap
//     filename = map['filename'];
//     title = map['title'];
//   }
//
//   @override
//   Map<String, dynamic> toMap() {
//     // TODO: implement toMap
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['filename'] = filename;
//     data['title'] = title;
//     return data;
//   }
// }

class Reviews extends Serializable{
  String? commenter;
  String? comment;
  dynamic rate;
  String? date;

  Reviews({this.commenter, this.comment, this.rate, this.date});

  @override
  void fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    commenter = map['commenter'];
    comment = map['comment'];
    rate = map['rate'];
    date = map['date'];
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commenter'] = commenter;
    data['comment'] = comment;
    data['rate'] = rate;
    data['date'] = date;
    return data;
  }
}

