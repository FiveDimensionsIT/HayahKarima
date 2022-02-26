
import 'dart:ui';

import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/models/customer_data.dart';
import 'package:hayah_karema/app/common/managers/cache/models/user_data.dart';
import 'package:hayah_karema/services/persistence/cache/abs_cache_service.dart';
import 'package:hayah_karema/services/persistence/cache/fake_cache_service.dart';


/// used for debugging only
class DebugCacheManager implements ICacheManager{

  late AbsCacheService _cacheService;

  DebugCacheManager(){
    _cacheService = FakeCacheService();
    //
    //setLocalApi();

  }

  Future<void> setLocalApi() async{
    await setCustomerData(CustomerData(serviceUrl: "https://schoolapi.conveyor.cloud"));
  }

  @override
  CustomerData? getCustomerData() {
    return _cacheService.retrieveObject("customer", new CustomerData());
  }

  @override
  Future<void> setCustomerData(CustomerData data) {
    return _cacheService.storeObject("customer", data);
  }

  @override
  Future<void> init() async{
    // do nothing
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
    return Locale('en');
  }

  @override
  bool? logout() {

  }


}