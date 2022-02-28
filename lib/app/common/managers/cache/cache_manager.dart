import 'dart:ui';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/services/persistence/cache/abs_cache_service.dart';


class CacheManager implements ICacheManager {
  AbsCacheService _cacheService;

  CacheManager(this._cacheService);

  @override
  Future<void> init() {
    return _cacheService.init();
  }

  @override
  UserData? getUserData() {
    return _cacheService.retrieveObject('user', UserData());
  }

  @override
  Future<void> setUserData(UserData data) {
    return _cacheService.storeObject('user', data);
  }

  @override
  Locale? getAppLocale() {
    var userData = getUserData();
    if (userData == null) return Get.deviceLocale;
    if (userData.langNo == 0) return const Locale('en');
    if (userData.langNo == 1) return const Locale('ar');
    return Get.deviceLocale;
  }

  @override
  bool? logout() {
    /// remove cached customer data
    _cacheService.remove('customer');
    /// remove cached user data
    _cacheService.remove('user');
    return true;
  }
}
