import 'package:hayah_karema/app/common/managers/api/post/_model/post_request.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_type.dart';
import 'package:hayah_karema/app/common/managers/api/post/i_post_api_manager.dart';

class FakePostApiManager implements IPostApiManager{
  @override
  Future addPost({PostRequestModel? postRequest}) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<List<PostTypeModel>?> getPostsType() async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

}