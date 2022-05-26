import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_controller.dart';

class NewPostBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewPostController>(() =>
        NewPostController());
  }


}