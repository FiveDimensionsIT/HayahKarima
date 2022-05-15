import 'package:get/get.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

class NewPasswordController extends GetxController {
  String? newPassword, confirmNewPassword;
  var loginLoading = false.obs;

  void onConfirmClick() {
    if(newPassword != confirmNewPassword){
      OverlayHelper.showErrorToast('تأكيد كلمة المرور ليست مطابقة لكلمة المرور الجديدة');
      return;
    }
    Get.back(result: newPassword);
  }
  
}
