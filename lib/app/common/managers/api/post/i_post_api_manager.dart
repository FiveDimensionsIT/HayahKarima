import 'package:hayah_karema/app/common/managers/api/post/_model/post_request.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_type.dart';

abstract class IPostApiManager{

  Future<List<PostTypeModel>?> getPostsType();

  Future addPost({PostRequestModel? postRequest});

}