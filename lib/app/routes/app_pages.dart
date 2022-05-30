import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/shop/product_details/product_details_view.dart';
import 'package:hayah_karema/app/pages/shop/products_category/products_category_binding.dart';
import 'package:hayah_karema/app/pages/shop/products_category/products_category_view.dart';

import '../pages/add_user/add_user_binding.dart';
import '../pages/add_user/add_user_view.dart';
import '../pages/auth/change_password/change_password_binding.dart';
import '../pages/auth/change_password/change_password_view.dart';
import '../pages/auth/forgot_password/forgot_password_binding.dart';
import '../pages/auth/forgot_password/forgot_password_view.dart';
import '../pages/auth/login/login_binding.dart';
import '../pages/auth/login/login_view.dart';
import '../pages/auth/new_password/new_password_binding.dart';
import '../pages/auth/new_password/new_password_view.dart';
import '../pages/auth/verify_mobile_number/verify_mobile_number_binding.dart';
import '../pages/auth/verify_mobile_number/verify_mobile_number_view.dart';
import '../pages/comment/comment_binding.dart';
import '../pages/comment/commnet_view.dart';
import '../pages/details_course/details_course_binding.dart';
import '../pages/details_course/details_course_view.dart';
import '../pages/digital_pointer/digital_pointer_binding.dart';
import '../pages/digital_pointer/digital_pointer_view.dart';
import '../pages/grids_view/birth_place/birth_place_binding.dart';
import '../pages/grids_view/birth_place/birth_place_view.dart';
import '../pages/grids_view/creators/creators_binding.dart';
import '../pages/grids_view/creators/creators_view.dart';
import '../pages/grids_view/homeland_martyrs/homeland_martyrs_binding.dart';
import '../pages/grids_view/homeland_martyrs/homeland_martyrs_view.dart';
import '../pages/grids_view/proficients/proficients_binding.dart';
import '../pages/grids_view/proficients/proficients_view.dart';
import '../pages/grids_view/sponsors/sponsors_binding.dart';
import '../pages/grids_view/sponsors/sponsors_view.dart';
import '../pages/home/home_binding.dart';
import '../pages/home/home_view.dart';
import '../pages/new_post/new_post_binding.dart';
import '../pages/new_post/new_post_view.dart';
import '../pages/notification/notification_binding.dart';
import '../pages/notification/notification_view.dart';
import '../pages/prizes/prizes_binding.dart';
import '../pages/prizes/prizes_view.dart';
import '../pages/profile/profile_binding.dart';
import '../pages/profile/profile_view.dart';
import '../pages/shop/products/product_binding.dart';
import '../pages/shop/products/products_view.dart';
import '../pages/side_menu/side_menu_binding.dart';
import '../pages/side_menu/side_menu_view.dart';
import '../pages/splash/splash_binding.dart';
import '../pages/splash/splash_view.dart';
import '../pages/training_course/training_course_binding.dart';
import '../pages/training_course/training_course_view.dart';
import '../pages/users/users_binding.dart';
import '../pages/users/users_view.dart';

part 'app_routes.dart';

const _pageTransition = Transition.circularReveal;
const _transitionDuration = Duration(milliseconds: 700);

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_VIEW;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH_VIEW,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.FORGOT_PASSWORD,
        page: () => ForgotPasswordView(),
        binding: ForgotPasswordBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.VERIFY_AUTH,
        page: () => VerifyMobileNoView(),
        binding: VerifyMobileNoBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.NEW_PASSWORD,
        page: () => NewPasswordView(),
        binding: NewPasswordBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.FORGOT_PASSWORD,
        page: () => ForgotPasswordView(),
        binding: ForgotPasswordBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.VERIFY_AUTH,
        page: () => VerifyMobileNoView(),
        binding: VerifyMobileNoBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.NEW_PASSWORD,
        page: () => NewPasswordView(),
        binding: NewPasswordBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.HOMELAND_MARTYRS,
        page: () => HomelandMartyrsView(),
        binding: HomelandMartyrsBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.PROFICIENTS,
        page: () => ProficientsView(),
        binding: ProficientsBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.CREATORS,
        page: () => CreatorsView(),
        binding: CreatorsBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.TOP_COMPANIES,
        page: () => SponsorsView(),
        binding: SponsersBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.SIDE_MENU,
        page: () => SideMenuView(),
        binding: SideMenuBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.DIGITAL_POINTER,
        page: () => DigitalPointerView(),
        binding: DigitalPointerBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.NEW_POST,
        page: () => NewPostView(),
        binding: NewPostBinding(),
        transition: _pageTransition),
    GetPage(
        name: _Paths.NOTIFICATION_VIEW,
        page: () => const NotificationView(),
        binding: NotificationBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.COMMENT_VIEW,
        page: () => const CommentView(),
        binding: CommentBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.CHANGE_PASSWORD,
        page: () => ChangePasswordView(),
        binding: ChangePasswordBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.TRAINING_COURSE,
        page: () => TrainingCourseView(),
        binding: TrainingCourseBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.DETAILS_COURSE,
        page: () => DetailsCourseView(),
        binding: DetailsCourseBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
        name: _Paths.BIRTH_PLACE,
        page: () => BirthPlaceView(),
        binding: BirthPlaceBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration),
    GetPage(
      name: _Paths.PRIZES,
      page: () => PrizesView(),
      binding: PrizesBinding(),
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => ProductSView(),
      binding: ProductBinding(),
    ),
    /// edit this
    GetPage(
      name: _Paths.SHOP_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_CATEGORY,
      page: () => ProductSCategoryView(),
      binding: ProductCategoriesBinding(),
    ),
  ];
}
