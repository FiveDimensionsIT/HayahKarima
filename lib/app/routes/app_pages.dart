import 'package:get/get.dart';

import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_binding.dart';
import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_view.dart';
import 'package:hayah_karema/app/pages/auth/login/login_binding.dart';
import 'package:hayah_karema/app/pages/auth/login/login_view.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_binding.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_view.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_binding.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_view.dart';
import 'package:hayah_karema/app/pages/home/home_binding.dart';
import 'package:hayah_karema/app/pages/home/home_view.dart';
import 'package:hayah_karema/app/pages/splash/splash_binding.dart';
import 'package:hayah_karema/app/pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_VIEW,
      page: () => SplashView(),
      binding: SplashBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.FORGOT_PASSWORD,
          page: () => ForgotPasswordView(),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: _Paths.VERIFY_AUTH,
          page: () => VerifyMobileNoView(),
          binding: VerifyMobileNoBinding(),
        ),
        GetPage(
          name: _Paths.NEW_PASSWORD,
          page: () => NewPasswordView(),
          binding: NewPasswordBinding(),
        ),
      ]
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
