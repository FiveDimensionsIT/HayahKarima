import 'package:get/get.dart';

class CommentController extends GetxController{

  var comment = ''.obs;
  var loadingApi = false.obs;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad() {
    /// get post comments.
    _getCommentsApi();
  }

  _getCommentsApi(){

  }

}