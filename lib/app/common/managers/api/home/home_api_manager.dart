import 'dart:convert';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class HomeApiManager implements IHomeApiManager {
  final IHttpService _httpService;

  HomeApiManager(this._httpService);

  @override
  Future<List<PointerItemModel>?> getStatisticNumber(DigitalPointerRequest params) async {
    final _params = '?statusId=${params.statusId}&PageNumber=${params.pageNo}&code=EG';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Countries/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<PointerItemModel>?> getProvincesPointer(DigitalPointerRequest params) async {
    final _params =
        '?countryId=${params.countryId}&statusId=${params.statusId}&PageNumber=${params.pageNo}&PageSize=${params.pageSize}&OrderBy=${params.orderBy}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Governorates/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<PointerItemModel>?> getCategoriesPointer(DigitalPointerRequest params) async {
    final _params = '?PageNumber=${params.pageNo}&PageSize=${params.pageSize}&OrderBy=${params.orderBy}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'DigitalIndexCategories/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<PointerItemModel>?> getCentersPointer(DigitalPointerRequest params) async {
    final _params =
        '?countryId=${params.countryId}&statusId=${params.statusId}&PageNumber=${params.pageNo}&PageSize=${params.pageSize}&OrderBy=${params.orderBy}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Centers/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<PointerItemModel>?> getContactsSearch(DigitalPointerRequest params) async {
    final _params =
        '?roleId=${params.roleId}&statusId=${params.statusId}&PageNumber=${params.pageNo}&PageSize=${params.pageSize}&OrderBy=${params.orderBy}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Contacts/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<PointerItemModel>?> getVillagesPointer(DigitalPointerRequest params) async {
    final _params =
        '?countryId=${params.countryId}&statusId=${params.statusId}&PageNumber=${params.pageNo}&PageSize=${params.pageSize}&OrderBy=${params.orderBy}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Villages/Search$_params',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(
          json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<GalleryModel>?> getContactsGallery(int contactId) async {
    final _params = '?countryId=$contactId&PageNumber=1';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'ContactImages/Search$_params',
    )..addJsonHeaders();
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
