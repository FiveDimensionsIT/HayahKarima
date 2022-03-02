import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/comment/comment_controller.dart';

class CommentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() =>
        CommentController());
  }


}