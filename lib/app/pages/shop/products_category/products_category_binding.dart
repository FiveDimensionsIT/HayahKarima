import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/shop/products_category/products_category_controller.dart';

class ProductCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsCategoryController>(
          () => ProductsCategoryController(),
    );
  }
}
