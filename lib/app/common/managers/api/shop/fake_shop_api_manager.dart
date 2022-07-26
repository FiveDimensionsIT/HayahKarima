import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_details_model.dart';
import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_model.dart';

import 'i_shop_api_manager.dart';

class FakeShopApiManager implements IShopApiManager {

  @override
  Future<List<ProductItemModel>?> getProducts() async{
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<ProductDetailsModel?> getProductDetails(int id) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}