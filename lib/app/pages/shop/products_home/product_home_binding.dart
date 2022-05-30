import 'package:get/get.dart';

import 'products_home_controller.dart';

class ProductHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsHomeController>(
      () => ProductsHomeController(),
    );
  }
}
