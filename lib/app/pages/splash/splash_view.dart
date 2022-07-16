import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/running_app.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/auth/forgot_password/forgot_password_view.dart';
import 'package:hayah_karema/app/pages/auth/login/login_view.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_view.dart';
import 'package:hayah_karema/app/pages/auth/verify_mobile_number/verify_mobile_number_view.dart';
import 'package:hayah_karema/config/app_config.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:rive/rive.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: Stack(
          children: [
            _buildTopShapeDesign(),
            _buildBottomShapeDesign(),
            _buildLogoDesign(),
            _buildPoweredBy(),
            _buildAuthPages(),
          ],
        ));
  }

  Widget _buildAuthPages() {
    return Obx(() {
      return Visibility(
        visible: controller.authViewVisibility.value,
        child: Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: Get.height / 1.8,
            decoration: BoxDecoration(
                color: AppColors.current.neutral,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageViewController,
              children: [
                LoginView(),
                ForgotPasswordView(),
                VerifyMobileNoView(),
                NewPasswordView(),
              ],
            ),
          ),
        ),
      );
    });
  }
//borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
  Center _buildLogoDesign() {
    final runningApp = DI.find<AppConfig>().runningApp;
    return Center(
      child: SizedBox(
        height: Get.height / 2.5,
        child: runningApp == RunningApp.HayahKarima
            ? const RiveAnimation.asset(AppAssets.splashAnim)
            : ClipOval(child: Image.asset(AppAssets.readersClubIcon)),
      ),
    );
  }

  Positioned _buildBottomShapeDesign() => Positioned(
      left: 0,
      bottom: 0,
      child: Image.asset(
        AppAssets.splash1,
        height: Get.height / 3,
        fit: BoxFit.fill,
        color: AppColors.current.accent,
      ));

  Positioned _buildTopShapeDesign() => Positioned(
      right: 0,
      top: 0,
      child: InteractiveViewer(
        child: Image.asset(
          AppAssets.splash2,
          height: Get.height / 3,
          fit: BoxFit.fill,
          color: AppColors.current.accent,
        ),
      ));

  Widget _buildPoweredBy() {
    return Positioned(
        bottom: 5,
        left: 0,
        right: 0,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.poweredBy,
              width: 40,
              height: 30,
            ),
            const SizedBox(width: 5),
            Text(
              "Powered by",
              style: TextStyle(color: AppColors.current.primary, fontSize: 11),
            ),
          ],
        )));
  }
}
