import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class TimelinePostModel extends Serializable{
  int? id;
  String? code;
  String? post;
  Object? video;
  String? approveDate;
  String? userName;
  String? userAvatar;
  String? postType;
  int? points;

  TimelinePostModel({this.id, this.code, this.post, this.video, this.approveDate, this.userName, this.userAvatar, this.postType, this.points, });

  @override
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    code = map['code'];
    post = map['post'];
    video = map['video'];
    approveDate = map['approveDate'];
    userName = map['userName'];
    userAvatar = map['userAvatar'];
    postType = map['postType'];
    points = map['points'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['post'] = this.post;
    data['video'] = this.video;
    data['approveDate'] = this.approveDate;
    data['userName'] = this.userName;
    data['userAvatar'] = this.userAvatar;
    data['postType'] = this.postType;
    data['points'] = this.points;
    return data;
  }
}

