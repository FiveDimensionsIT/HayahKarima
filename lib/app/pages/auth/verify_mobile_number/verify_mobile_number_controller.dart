import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';
import 'package:hayah_karema/services/firebase_phone_auth/i_firebase_phone_auth.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class VerifyMobileNoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final _action = ActionCenter();
  final _splashController = Get.find<SplashController>();

  final _fPhoneAuthService = DI.find<IFirebasePhoneAuth>();

  String? currentCode;
  var loginLoading = false.obs;
  var verifyLoading = false.obs;
  var resendLoading = false.obs;
  var hasError = false.obs;
  var timeout = "04:00".obs;
  var _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
  }

  void onVerifyBtnPressed() {
    if (currentCode == null || currentCode!.isEmpty || currentCode?.length != 6) {
      hasError.value = true;
      return;
    }
    verifyLoading.value = true;
    _fPhoneAuthService.verifySMSCode(
        code: currentCode!,
        onCodeVerified: (result) {
          verifyLoading.value = false;
          if (result != null && result is bool && result) {
            Get.back(result: true);
          }
        });
  }

  void onResendBtnPressed() {
    _timer?.cancel();
    final countryCode = Get.arguments['CountryCode'];
    final phoneNumber = Get.arguments['PhoneNumber'];

    _fPhoneAuthService.authenticatePhone(
      countryCode: countryCode,
      phoneNumber: phoneNumber,
      onCodeSent: () {
        _startTimer();
        OverlayHelper.showInfoToast('${AppText.enterCodeSent} $countryCode $phoneNumber');
      },
      onVerificationCompleted: () {
        Get.back(result: true);
      },
      onFailed: () {

      },
    );
  }

  _startTimer() {
    int mins = 3, secs = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (sec) {
      secs--;
      timeout.value = '0$mins:${secs > 10 ? secs : '0$secs'}';
      // debugPrint('timeout ${timeout.value}');
      if (secs == 0 && mins == 0) {
        _timer?.cancel();
      }
      if (secs == 0) {
        mins = 0;
        secs = 60;
      }
    });
  }

  void onConfirmClick() {

    navigateToEnterNewPassword();
  }

  void navigateToEnterNewPassword(){
    _splashController.navigateToPageView(3);
  }

  void backToForgotPassword(){
    _splashController.navigateToPageView(1);
  }
}
