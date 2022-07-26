import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/orders/_models/orders_request.dart';
import 'package:hayah_karema/app/common/managers/api/orders/i_orders_api_managers.dart';

class FakeOrdersApiManager implements IOrdersApiManager {

  @override
  Future<List<GalleryModel>?> getOrders(OrdersRequest? requestModel) async{
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

}