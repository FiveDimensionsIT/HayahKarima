import 'package:get/get.dart';

import 'verify_mobile_number_controller.dart';

class VerifyMobileNoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyMobileNoController>(
      () => VerifyMobileNoController(),
    );
  }
}
