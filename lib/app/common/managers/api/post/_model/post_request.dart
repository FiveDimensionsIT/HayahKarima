import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class PostRequestModel extends Serializable{
  String? userId;
  String? post;
  int? postTypeId;
  String? date;
  String? video;
  int? points;
  List<ImageModel>? images;

  PostRequestModel({this.userId, this.images, this.post, this.postTypeId, this.date, this.video, this.points, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    post = map['post'];
    postTypeId = map['postTypeId'];
    date = map['date'];
    video = map['video'];
    points = map['points'];
    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add((ImageModel()..fromMap(v)));
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['post'] = this.post;
    data['postTypeId'] = this.postTypeId;
    data['date'] = this.date;
    data['video'] = this.video;
    data['points'] = this.points;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class ImageModel extends Serializable{
  String? image;

  ImageModel({ this.image, });

  @override
  void fromMap(Map<String, dynamic> map) {
    image = map['image'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}



