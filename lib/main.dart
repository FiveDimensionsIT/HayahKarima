import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_translations.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/profile_addresses.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/profile_payment_cards.dart';
import 'package:hayah_karema/app/pages/profile/profile_binding.dart';
import 'package:hayah_karema/setup.dart';

import 'app/routes/app_pages.dart';

void main() async{
  /// setup locator.
  setup();
  /// run app
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (cxt, child)=> GetMaterialApp(
        title: "حياة كريمة",
        // initialRoute: AppPages.INITIAL,
        // getPages: AppPages.routes,
        enableLog: BUILD_TYPE == BuildType.debug,
        locale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        translations: AppTranslations(),
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: BUILD_TYPE == BuildType.debug,

        // todo  for test only
        initialBinding: ProfileBinding(),
        home: const ProfilePaymentCards(),
      ),
    ),
  );
}

enum BuildType {debug, test, release}
const BuildType BUILD_TYPE = BuildType.debug;
