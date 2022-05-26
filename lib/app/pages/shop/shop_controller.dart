import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
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
  final searchTextEditingController = TextEditingController();
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
  void increment() => count.value++;
}
