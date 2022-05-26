import 'package:hayah_karema/utils/serialization/serialization_lib.dart';
class PostRequestModel extends Serializable{
  String? userId;
  String? post;
  int? postTypeId;
  String? date;
  MediaModel? video;
  int? points;
  List<Images?>? images;

  PostRequestModel({this.userId, this.post, this.postTypeId, this.date, this.video, this.points, this.images, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    post = map['post'];
    postTypeId = map['postTypeId'];
    date = map['date'];
    video = map['video'] != null ? (MediaModel()..fromMap(map['video'])) : null;
    points = map['points'];
    if (map['images'] != null) {
      images = [];
      map['images'].forEach((v) {
        images!.add((Images()..fromMap(v)));
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
    if (this.video != null) {
      data['video'] = this.video!.toMap();
    }
    data['points'] = this.points;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v?.toMap()).toList();
    }
    return data;
  }
}

class MediaModel extends Serializable{
  String? filename;
  String? base64;

  MediaModel({this.filename, this.base64, });

  @override
  void fromMap(Map<String, dynamic> map) {
    filename = map['filename'];
    base64 = map['base64'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['base64'] = this.base64;
    return data;
  }
}

class Images extends Serializable{
  MediaModel? image;

  Images({this.image, });

  @override
  void fromMap(Map<String, dynamic> map) {
    image = map['image'] != null ? (MediaModel()..fromMap(map['image'])) : null;
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toMap();
    }
    return data;
  }
}






