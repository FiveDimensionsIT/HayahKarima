import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/setup.dart';

class LoginController extends GetxController {

  String? mobileNo;
  String? password;
  var loginLoading = false.obs;

  final _action = ActionCenter();

  // final _loginManager = DI.find<ILoginApiManager>();
  final _cacheManager = DI.find<ICacheManager>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onLoginClick(){

    navigateToHomePage();
  }

  void navigateToForgotPassword(){
    Get.find<SplashController>().navigateToPageView(1);
  }

  void navigateToHomePage(){
    Get.offAllNamed(Routes.HOME);
  }
}
