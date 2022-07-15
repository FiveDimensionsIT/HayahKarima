import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/managers/navigation_manager.dart';
import 'package:hayah_karema/config/setup.dart';

class SplashController extends GetxController {

  final _cacheManager = DI.find<ICacheManager>();
  final _pageViewController = PageController();
  PageController get pageViewController => _pageViewController;

  var authViewVisibility = false.obs;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad()async{
    await _cacheManager.init();
    await Future.delayed(const Duration(seconds: 3));
    _navigateNoNextPage();
  }

  _navigateNoNextPage(){
    //
    final userData = _cacheManager.getUserData();
    //
    if(userData == null){
      authViewVisibility.value = true;
      return;
    }
    // navigate to home page
    NavigationManager().navigateToHomePage(userData.userRole);
  }

  @override
  void onClose() {
    _pageViewController.dispose();
    super.onClose();
  }


  void navigateToPageView(int pageNo){
    _pageViewController.jumpToPage(pageNo);
  }
}
