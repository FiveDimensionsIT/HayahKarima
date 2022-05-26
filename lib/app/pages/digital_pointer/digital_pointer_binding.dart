import 'package:get/get.dart';

import 'digital_pointer_controller.dart';

class DigitalPointerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitalPointerController>(
      () => DigitalPointerController(),
    );
  }
}
