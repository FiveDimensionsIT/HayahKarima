import 'package:get/get.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

class OrdersController extends GetxController {
  //TODO: Implement OrdersController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  var currentTabIndex = 0.obs;

  void goToOrderDetailsView() {
    Get.toNamed(Routes.ORDER_DETAILS);
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
