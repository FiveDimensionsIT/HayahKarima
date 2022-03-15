import 'package:get/get.dart';

import 'package:hayah_karema/app/pages/auth/change_password/change_password_binding.dart';
import 'package:hayah_karema/app/pages/auth/change_password/change_password_view.dart';
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
import 'package:hayah_karema/app/pages/digital_pointer/digital_pointer_binding.dart';
import 'package:hayah_karema/app/pages/digital_pointer/digital_pointer_view.dart';
import 'package:hayah_karema/app/pages/grids_view/creators/creators_binding.dart';
import 'package:hayah_karema/app/pages/grids_view/creators/creators_view.dart';
import 'package:hayah_karema/app/pages/grids_view/homeland_martyrs/homeland_martyrs_binding.dart';
import 'package:hayah_karema/app/pages/grids_view/homeland_martyrs/homeland_martyrs_view.dart';
import 'package:hayah_karema/app/pages/grids_view/proficients/proficients_binding.dart';
import 'package:hayah_karema/app/pages/grids_view/proficients/proficients_view.dart';
import 'package:hayah_karema/app/pages/grids_view/sponsors/sponsors_binding.dart';
import 'package:hayah_karema/app/pages/grids_view/sponsors/sponsors_view.dart';
import 'package:hayah_karema/app/pages/home/home_binding.dart';
import 'package:hayah_karema/app/pages/home/home_view.dart';
import 'package:hayah_karema/app/pages/new_post/new_post_binding.dart';
import 'package:hayah_karema/app/pages/new_post/views/new_post_view.dart';
import 'package:hayah_karema/app/pages/notification/notification_binding.dart';
import 'package:hayah_karema/app/pages/notification/notification_view.dart';
import 'package:hayah_karema/app/pages/profile/profile_binding.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_view.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_binding.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';
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
    ),
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
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOMELAND_MARTYRS,
      page: () => HomelandMartyrsView(),
      binding: HomelandMartyrsBinding(),
    ),
    GetPage(
      name: _Paths.PROFICIENTS,
      page: () => ProficientsView(),
      binding: ProficientsBinding(),
    ),
    GetPage(
      name: _Paths.CREATORS,
      page: () => CreatorsView(),
      binding: CreatorsBinding(),
    ),
    GetPage(
      name: _Paths.TOP_COMPANIES,
      page: () => SponsorsView(),
      binding: SponsersBinding(),
    ),
    GetPage(
      name: _Paths.SIDE_MENU,
      page: () => SideMenuView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.DIGITAL_POINTER,
      page: () => DigitalPointerView(),
      binding: DigitalPointerBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NEW_POST,
      page: () => const NewPostView(),
      binding: NewPostBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_VIEW,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.COMMENT_VIEW,
      page: () => const CommentView(),
      binding: CommentBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
