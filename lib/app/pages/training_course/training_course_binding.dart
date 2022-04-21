import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';

class TrainingCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainingCourseController>(
          () => TrainingCourseController(),
    );
  }
}
