import 'package:get/get.dart';

class ProfileController extends GetxController {

  String? name, nationalId,title,email,phone,address;
  var loginLoading = false.obs;

  navigateToHomePage(){

  }

  void onConfirmClick() {
    navigateToHomePage();
  }



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
