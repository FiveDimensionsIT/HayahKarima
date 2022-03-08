import 'package:get/get.dart';

import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_binding.dart';
import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_view.dart';
import 'package:hayah_karema/app/pages/auth/login/login_binding.dart';
import 'package:hayah_karema/app/pages/auth/login/login_view.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_binding.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_view.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_binding.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_view.dart';
import 'package:hayah_karema/app/pages/comment/comment_binding.dart';
import 'package:hayah_karema/app/pages/comment/commnet_view.dart';
import 'package:hayah_karema/app/pages/home/home_binding.dart';
import 'package:hayah_karema/app/pages/home/home_view.dart';
import 'package:hayah_karema/app/pages/my_village/my_village_binding.dart';
import 'package:hayah_karema/app/pages/my_village/my_village_view.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_binding.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_view.dart';
import 'package:hayah_karema/app/pages/notification/notification_binding.dart';
import 'package:hayah_karema/app/pages/notification/notification_view.dart';
import 'package:hayah_karema/app/pages/splash/splash_binding.dart';
import 'package:hayah_karema/app/pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //static const INITIAL = Routes.SPLASH_VIEW;
  static const INITIAL = Routes.MY_VILLAGE;
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
    GetPage(name: _Paths.NEW_POST,
      page: ()=> NewPostView(),
      binding: NewPostBinding(),
    ),
    GetPage(name: _Paths.NOTIFICATION_VIEW,
        page: ()=> NotificationView(),
        binding: NotificationBinding(),
    ),
    GetPage(name: _Paths.COMMENT_VIEW,
      page: ()=> CommentView(),
      binding: CommentBinding(),
    ),
    GetPage(name: _Paths.MY_VILLAGE,
      page: ()=> MyVillageView(),
      binding: MyVillageBinding(),
    ),
  ];
}
