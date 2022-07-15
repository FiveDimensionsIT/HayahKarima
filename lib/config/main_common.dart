import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_translations.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/app_config.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/firebase_options.dart';

void mainCommon(AppConfig appConfig) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  /// setup locator.
  setupLiveMode(appConfig);
  /// run app
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (cxt, child)=> GetMaterialApp(
        title: appConfig.appTitle,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        enableLog: BUILD_TYPE == BuildType.debug,
        locale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        translations: AppTranslations(),
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: BUILD_TYPE == BuildType.debug,
      ),
    ),
  );
}

enum BuildType {debug, test, release}
const BuildType BUILD_TYPE = BuildType.debug;
