import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_view.dart';
import 'package:hayah_karema/app/pages/auth/login/login_view.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_view.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_view.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: Stack(children: [

          _buildTopShapeDesign(),

          _buildBottomShapeDesign(),

          _buildLogoDesign(),

          _buildAuthPages(),
        ],)
    );
  }

  Widget _buildAuthPages() {
    return Obx(() {
      return Visibility(
        visible: controller.authViewVisibility.value,
        child: Positioned(
          bottom: 0, left: 0, right: 0,
          child: Container(
            height: Get.height / 1.8,
            decoration: BoxDecoration(
                color: AppColors.current.neutral,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]
            ),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageViewController,
              children: [

                LoginView(),

                ForgotPasswordView(),

                VerifyMobileNoView(),

                NewPasswordView(),

              ],),
          ),
        ),
      );
    });
  }


  Center _buildLogoDesign() {
    return Center(child: Stack(
      children: [
        Image.asset(AppAssets.splash3),
        Image.asset(AppAssets.splash4),
        Image.asset(AppAssets.splash5),
        Image.asset(AppAssets.splash6),
      ],),);
  }

  Positioned _buildBottomShapeDesign() =>
      Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            AppAssets.splash1,
            height: Get.height / 3,
            fit: BoxFit.fill,
          ));

  Positioned _buildTopShapeDesign() =>
      Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            AppAssets.splash2,
            height: Get.height / 3,
            fit: BoxFit.fill,
          ));
}
