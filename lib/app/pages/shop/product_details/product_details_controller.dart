import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ShopController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }
  Future<void> onRefresh() async{
    // add data here.
  }
  void _onLoad() async {
    // add data here.
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}