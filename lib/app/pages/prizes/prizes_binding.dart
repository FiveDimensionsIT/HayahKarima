import 'package:get/get.dart';

import 'prizes_controller.dart';

class PrizesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrizesController>(
      () => PrizesController(),
    );
  }
}
