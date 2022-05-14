import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';

class NewPasswordController extends GetxController {
  String? newPassword, confirmNewPassword;
  var loginLoading = false.obs;

  final _action = ActionCenter();

  navigateForgotPassword() {

  }

  navigateToHomePage(){

  }

  void onConfirmClick() {
    //
    navigateToHomePage();
  }
  
}
