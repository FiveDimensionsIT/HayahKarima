import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_details_model.dart';
import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_model.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

import 'i_shop_api_manager.dart';

class ShopApiManager implements IShopApiManager {

  final IHttpService _httpService;

  ShopApiManager(this._httpService);

  @override
  Future<List<ProductItemModel>?> getProducts() async{
    var request = HttpRequest(method: HttpMethod.get,
      url: 'Market/Products',)..addJsonHeaders();
    var resp = await _httpService.sendRequest(request);
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
     // return List<RewardModel>.from(jsonDecode(resp.data!).map((x) => RewardModel()..deserialize(jsonEncode(x))));
      return List<ProductItemModel>.from(jsonDecode(resp.data!).map((x) => ProductItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<ProductDetailsModel?> getProductDetails(int id) async{
    var request = HttpRequest(method: HttpMethod.get,
        url: 'Market/Products/$id',)..addJsonHeaders();
    var resp = await _httpService.sendRequest(request);
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return ProductDetailsModel()..deserialize(resp.data!);
    }
    return null;
  }
}