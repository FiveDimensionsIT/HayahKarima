
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/managers/cache/models/customer_data.dart';
import 'package:hayah_karema/app/common/managers/cache/models/user_data.dart';

abstract class ICacheManager{

  Future<void> init();

  Future<void> setCustomerData(CustomerData data);

  CustomerData? getCustomerData();

  Future<void> setUserData(UserData data);

  UserData? getUserData();

  Locale? getAppLocale();

  bool? logout();

}