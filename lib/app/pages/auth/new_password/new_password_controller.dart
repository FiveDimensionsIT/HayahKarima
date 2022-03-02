import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';

class NewPasswordController extends GetxController {
  String? newPassword, confirmNewPassword;
  var loginLoading = false.obs;

  final _action = ActionCenter();
  final _splashController = Get.find<SplashController>();

  navigateForgotPassword() {
    _splashController.navigateToPageView(1);
  }

  navigateToHomePage(){

  }

  void onConfirmClick() {
    //
    navigateToHomePage();
  }
  
}
