import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_controller.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuController>(() => SideMenuController(),);
    Get.lazyPut<SplashController>(() => SplashController(),);
  }
}
