import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/orders/_models/orders_request.dart';


abstract class IOrdersApiManager{
  Future<List<GalleryModel>?> getOrders(OrdersRequest? requestModel);

}