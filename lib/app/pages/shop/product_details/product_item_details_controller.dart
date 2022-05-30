import 'package:get/get.dart';

class ProductItemDetailsController extends GetxController {
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
