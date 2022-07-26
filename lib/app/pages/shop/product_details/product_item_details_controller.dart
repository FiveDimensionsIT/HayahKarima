import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_details_model.dart';
import 'package:hayah_karema/app/common/managers/api/shop/i_shop_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class ProductItemDetailsController extends GetxController {
  //TODO: Implement ShopController
  final _cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IShopApiManager>();
  final _action = ActionCenter();
  var getApiLoading = false.obs;
  Rx<ProductDetailsModel> productDetail = ProductDetailsModel().obs;
  var productId = Get.arguments["id"];

  @override
  void onInit() async{
    super.onInit();
    // await _cacheManager.init();
    _getProductDetails();

  }

  Future<void> onRefresh() async {
    _getProductDetails();
  }

  void _getProductDetails() async {
    getApiLoading.value = true;
    ProductDetailsModel? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getProductDetails(productId);
    }, checkConnection: true);
    //
    getApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        productDetail.value= result ?? ProductDetailsModel() ;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  @override
  void onClose() {}

}
