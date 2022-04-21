import 'package:get/get.dart';

import 'homeland_martyrs_controller.dart';

class HomelandMartyrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomelandMartyrsController>(
      () => HomelandMartyrsController(),
    );
  }
}
