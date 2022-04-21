import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/post/_model/post_request.dart';
import 'package:hayah_karema/app/common/managers/api/post/_model/post_type.dart';
import 'package:hayah_karema/app/common/managers/api/post/i_post_api_manager.dart';
import 'package:hayah_karema/services/http/http_classes.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class PostApiManager implements IPostApiManager{

  final IHttpService _httpService;

  PostApiManager(this._httpService);

  @override
  Future addPost({PostRequestModel? postRequest}) async{
    var request = HttpRequest(method: HttpMethod.post, url: 'UserPosts',data: postRequest)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return jsonDecode(resp.data!);
    }
    return null;
  }

  @override
  Future<List<PostTypeModel>?> getPostsType() async{
    var request = HttpRequest(method: HttpMethod.get, url: 'PostsTypes/Lookup',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PostTypeModel>.from(jsonDecode(resp.data!).map((x) => PostTypeModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

}