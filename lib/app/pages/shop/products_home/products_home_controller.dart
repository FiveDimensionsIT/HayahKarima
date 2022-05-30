import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

class ProductsHomeController extends GetxController {
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
  void goToProductsCategoryView() {
    Get.toNamed(Routes.PRODUCTS_CATEGORY);
  }

  void goToShopDetailsView() {
    Get.toNamed(Routes.PRODUCT_ITEM_DETAILS);
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
