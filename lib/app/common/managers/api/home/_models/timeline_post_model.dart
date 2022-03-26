import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class TimelinePostModel extends Serializable{
  int? id;
  String? code;
  String? post;
  String? video;
  String? approveDate;
  String? userName;
  String? userAvatar;
  String? postType;
  int? points;
  List<AttachmentModel>? attachments;

  TimelinePostModel({this.id, this.attachments, this.code, this.post, this.video, this.approveDate, this.userName, this.userAvatar, this.postType, this.points, });

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
    if (map['images'] != null) {
      attachments = [];
      if(video!=null && video!.isNotEmpty){
        attachments!.add((AttachmentModel(fileName: video, mediaType: MediaType.VIDEO)));
      }
      map['images'].forEach((v) {
        attachments!.add((AttachmentModel(fileName: v["fileName"], mediaType: MediaType.IMAGE)));
      });
    }
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
    if (this.attachments != null) {
      data['images'] = this.attachments!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class AttachmentModel extends Serializable{
  String? fileName;
  MediaType? mediaType;
  AttachmentModel({this.fileName, this.mediaType});
  @override
  void fromMap(Map<String, dynamic> map) {
    fileName = map['fileName'];
    mediaType = map['mediaType'];

  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['mediaType'] = this.mediaType;
    return data;
  }
}

enum MediaType{
  IMAGE,VIDEO
}

