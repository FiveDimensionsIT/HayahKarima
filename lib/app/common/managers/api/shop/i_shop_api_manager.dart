

import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_details_model.dart';
import 'package:hayah_karema/app/common/managers/api/shop/_models/poduct_model.dart';

abstract class IShopApiManager{
  Future<List<ProductItemModel>?> getProducts();
  Future<ProductDetailsModel?> getProductDetails(int id);
}