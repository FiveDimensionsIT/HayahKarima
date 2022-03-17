import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hayah_karema/app/pages/details_course/details_course_controller.dart';

class DetailsCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsCourseController>(
          () => DetailsCourseController(),
    );
  }
}
