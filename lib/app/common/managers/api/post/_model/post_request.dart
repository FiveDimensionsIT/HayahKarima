import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class PostRequestModel extends Serializable{
  String? userId;
  String? post;
  int? postTypeId;
  String? date;
  String? video;
  String? approvedBy;
  String? approveDate;
  int? points;
  List<ImageModel>? images;

  PostRequestModel({this.userId, this.images, this.post, this.postTypeId, this.date, this.video, this.approvedBy, this.approveDate, this.points, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    post = map['post'];
    postTypeId = map['postTypeId'];
    date = map['date'];
    video = map['video'];
    approvedBy = map['approvedBy'];
    approveDate = map['approveDate'];
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
    data['approvedBy'] = this.approvedBy;
    data['approveDate'] = this.approveDate;
    data['points'] = this.points;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class ImageModel extends Serializable{
  String? userPostId;
  String? fileName;

  ImageModel({this.userPostId, this.fileName, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userPostId = map['userPostId'];
    fileName = map['fileName'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userPostId'] = this.userPostId;
    data['fileName'] = this.fileName;
    return data;
  }
}



