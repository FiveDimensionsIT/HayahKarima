import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/orders/_models/orders_request.dart';
import 'package:hayah_karema/app/common/managers/api/orders/i_orders_api_managers.dart';
import 'package:hayah_karema/services/http/http_lib.dart';


class OrdersApiManager implements IOrdersApiManager {

  final IHttpService _httpService;

  OrdersApiManager(this._httpService);

  @override
  Future<List<GalleryModel>?> getOrders(OrdersRequest? requestModel) async {

    var request = HttpRequest(method: HttpMethod.post,
      url: 'Market/Orders',data: requestModel)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<GalleryModel>.from(
          json.decode(resp.data!).map((x) => GalleryModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

}