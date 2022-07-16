import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/running_app.dart';
import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/app_config.dart';
import 'package:hayah_karema/config/setup.dart';

class NavigationManager{
  final _currentApp = DI.find<AppConfig>().runningApp;
  static final NavigationManager _singleton = NavigationManager._internal();
  NavigationManager._internal();
  factory NavigationManager() {
    return _singleton;
  }

  void navigateToHomePage(UserType userType) {
    if(_currentApp == RunningApp.ReadersClub){
      Get.offAllNamed(Routes.HOME);
    }
    else {
      if(userType== UserType.admin){
        Get.offAllNamed(Routes.DIGITAL_POINTER);
      }else if(userType== UserType.user){
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

}