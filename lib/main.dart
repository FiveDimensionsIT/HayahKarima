import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_translations.dart';
import 'package:hayah_karema/setup.dart';
import 'app/routes/app_pages.dart';

void main() async{
  /// setup locator.
  setup();
  /// run app
  runApp(
    GetMaterialApp(
      title: "حياة كريمة",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      enableLog: BUILD_TYPE == BuildType.debug,
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      translations: AppTranslations(),
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: BUILD_TYPE == BuildType.debug,
    ),
  );
}

enum BuildType {debug, test, release}
const BuildType BUILD_TYPE = BuildType.debug;
