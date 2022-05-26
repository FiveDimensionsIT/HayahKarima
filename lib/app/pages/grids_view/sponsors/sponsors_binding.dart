import 'package:get/get.dart';

import 'sponsors_controller.dart';

class SponsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SponsersController>(
      () => SponsersController(),
    );
  }
}
