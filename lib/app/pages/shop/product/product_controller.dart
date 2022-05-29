import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

class ProductController extends GetxController {
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


  void goToShopDetailsView() {
    Get.toNamed(Routes.SHOP_DETAILS);
  }

  final searchTextEditingController = TextEditingController();
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
  void increment() => count.value++;
}
