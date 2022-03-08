import 'dart:convert';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/login_model.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/auth/i_auth_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/managers/navigation_manager.dart';
import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/splash/splash_controller.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/parse_token.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class LoginController extends GetxController {
  var userName = ''.obs;
  var password = ''.obs;
  var loginLoading = false.obs;

  final _action = ActionCenter();
  final _apiManager = DI.find<IAuthApiManager>();
  final _cacheManager = DI.find<ICacheManager>();

  onLoginClick() {
    // validate email
    if(!userName.value.isNum && !userName.value.isEmail){
      OverlayHelper.showErrorToast(AppText.invalidUserName);
      return;
    }
    callLoginApi();
  }

  void navigateToForgotPassword() {
    Get.find<SplashController>().navigateToPageView(1);
  }

  void navigateToHomePage() {
    Get.offAllNamed(Routes.HOME);
  }

  // region ===== api

  void callLoginApi() async {
    loginLoading.value = true;
    LoginResponse? result;
    //
    var success = await _action.execute(() async {
      result = await _apiManager.login(LoginRequest(email: userName.value, password: password.value));
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
        // // غير معتمد
        // if (userData.status != 2) {
        //   OverlayHelper.showWarningToast('حسابك غير معتمد، برجاء قم بالتواصل مع الادارة');
        //   return;
        // }
        //
        // // ليس لة صلاحية
        // if (userData.groupStatus != 2) {
        //   OverlayHelper.showWarningToast('ليس لديك صلاحية الدخول الي التطبيق، برجاء قم بالتواصل مع الادارة');
        //   return;
        // }

        // save user data
        await _cacheManager.setUserData(userData);
        // navigate to next page
        NavigationManager().navigateToHomePage(userData.module == '1' ? UserType.admin : UserType.user);
      } else {
        OverlayHelper.showErrorToast(AppText.wrongUserPass);
      }
    }else{
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }

// endregion
}
