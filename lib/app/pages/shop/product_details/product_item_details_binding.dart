import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/shop/product_details/product_item_details_controller.dart';

class ProductItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductItemDetailsController>(
      () => ProductItemDetailsController(),
    );
  }
}
