import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class GalleryModel extends Serializable{
  int? id;
  String? filename;
  String? caption;

  GalleryModel({this.id, this.filename, this.caption, });

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

