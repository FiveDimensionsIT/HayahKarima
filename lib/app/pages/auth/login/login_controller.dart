import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/login_model.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/auth/i_auth_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/managers/navigation_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/parse_token.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class LoginController extends GetxController {
  final _keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> get keyForm => _keyForm;

  final firstTextEditingController = TextEditingController();
  final firstFocusNode = FocusNode();

  final middleTextEditingController = TextEditingController();
  final middleFocusNode = FocusNode();

  final lastTextEditingController = TextEditingController();
  final lastFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  var password = ''.obs;
  var loginLoading = false.obs;

  final _action = ActionCenter();
  final _apiManager = DI.find<IAuthApiManager>();
  final _cacheManager = DI.find<ICacheManager>();

  RxBool isUserCodeRequired = false.obs;

  @override
  void onClose() {
    firstFocusNode.dispose();
    middleFocusNode.dispose();
    lastFocusNode.dispose();
    firstTextEditingController.dispose();
    lastTextEditingController.dispose();
    middleTextEditingController.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  onLoginClick() {
    _keyForm.currentState?.save();
    if (_keyForm.currentState!.validate() &&
        (firstTextEditingController.text.isNotEmpty &&
            middleTextEditingController.text.isNotEmpty &&
            lastTextEditingController.text.isNotEmpty)) {
      String userCode =
          '${firstTextEditingController.text}-${middleTextEditingController.text}-${lastTextEditingController.text}';
      if (isUserCodeRequired.value == true) isUserCodeRequired.value = false;
      callLoginApi(userCode);
    } else {
      if (firstTextEditingController.text.isEmpty ||
          middleTextEditingController.text.isEmpty ||
          lastTextEditingController.text.isEmpty) {
        isUserCodeRequired.value = true;
      } else {
        if (isUserCodeRequired.value == true) isUserCodeRequired.value = false;
      }
    }
  }

  void navigateToForgotPassword() {
    Get.find<SplashController>().navigateToPageView(1);
  }

  void navigateToHomePage() {
    Get.offAllNamed(Routes.HOME);
  }

  // region ===== api

  void callLoginApi(String userCode) async {
    loginLoading.value = true;
    LoginResponse? result;
    //
    var success = await _action.execute(() async {
      result = await _apiManager.login(LoginRequest(code: userCode, password: password.value));
    }, checkConnection: true);
    //
    loginLoading.value = false;
    //
    if (success) {
      if (result != null) {

        if (result!.token == null || result!.token!.isEmpty) {
          OverlayHelper.showWarningToast(AppText.unHandledErrorAction);
          return;
        }
        // parse token to user data
        UserData userData = UserData()..deserialize(jsonEncode(parseJwt(result!.token!)));
        // save user data
        await _cacheManager.setUserData(userData);
        // navigate to next page
        NavigationManager().navigateToHomePage(userData.userRole);
      } else {
        OverlayHelper.showErrorToast(AppText.wrongUserPass);
      }
    }else{
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }

  appendUserCode(String val, FocusNode nextFocusNode, FocusNode? prevFocusNode) {
    if(val.isEmpty && prevFocusNode!=null){
      prevFocusNode.requestFocus();
      return;
    }
    if(val.length==3){
      nextFocusNode.requestFocus();
      return;
    }


  }

// endregion
}
