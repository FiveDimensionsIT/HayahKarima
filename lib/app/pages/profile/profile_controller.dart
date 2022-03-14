import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController  with GetSingleTickerProviderStateMixin{

  String? name, nationalId,title,email,phone,address;
  var loginLoading = false.obs;

  late TabController tabBarController;
  var currentTabIndex = 0.obs;


  @override
  void onInit() {
    super.onInit();
    tabBarController = TabController(length: 5, vsync: this);
  }


  @override
  void onClose() {
    tabBarController.dispose();
    super.onClose();
  }
}
