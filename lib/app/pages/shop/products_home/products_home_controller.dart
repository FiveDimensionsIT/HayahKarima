import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_model.dart';
import 'package:hayah_karema/app/common/managers/api/shop/i_shop_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class ProductsHomeController extends GetxController {
  //TODO: Implement ShopController

  final _cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IShopApiManager>();
  final _action = ActionCenter();
  var getApiLoading = false.obs;
  RxList<ProductItemModel> productsList = <ProductItemModel>[].obs;

  @override
  void onInit() async{
    super.onInit();
   // await _cacheManager.init();
    _getProducts();

  }

  Future<void> onRefresh() async {
    _getProducts();
  }

  void _getProducts() async {
    getApiLoading.value = true;
    List<ProductItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getProducts();
    }, checkConnection: true);
    //
    getApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        productsList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void goToProductsCategoryView() {
    Get.toNamed(Routes.PRODUCTS_CATEGORY);
  }
  void goToShopDetailsView(int? id) {
    Get.toNamed(Routes.PRODUCT_ITEM_DETAILS,arguments: {'id': id,});
  }
  final searchTextEditingController = TextEditingController();

  @override
  void onClose() {}

}
