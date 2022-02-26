import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final _pageViewController = PageController();
  PageController get pageViewController => _pageViewController;

  var authViewVisibility = false.obs;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad()async{
    await Future.delayed(const Duration(seconds: 3));
    _navigateNoNextPage();
  }

  _navigateNoNextPage(){
    // todo: check is logged in?

    authViewVisibility.value = true;
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
