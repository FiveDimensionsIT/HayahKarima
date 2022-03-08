import 'package:get/get.dart';

import 'proficients_controller.dart';

class ProficientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProficientsController>(
      () => ProficientsController(),
    );
  }
}
