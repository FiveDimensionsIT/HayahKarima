import 'package:get/get.dart';

import 'birth_place_controller.dart';

class BirthPlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BirthPlaceController>(
      () => BirthPlaceController(),
    );
  }
}
