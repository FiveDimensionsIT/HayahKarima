import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_controller.dart';
import 'products_home_controller.dart';

class ProductHomeBinding extends Bindings {
  @override
  void dependencies() {
    /// todo remove this for test only
    Get.lazyPut<SideMenuController>(() => SideMenuController());
    Get.lazyPut<ProductsHomeController>(() => ProductsHomeController());
  }
}
