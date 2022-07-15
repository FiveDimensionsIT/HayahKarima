import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/home/_models/answer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/martyrs_prayers_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/my_village_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/timeline_post_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
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
      // edit from Countries/Search to VillagesMgmt/Countries/Search
      url: 'VillagesMgmt/Countries/Search$_params',
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
      // edit from Governorates/Search to VillagesMgmt/Governorates/Search
      url: 'VillagesMgmt/Governorates/Search$_params',
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
      // edit from DigitalStandardCategories/Search to VillagesMgmt/DigitalStandardCategories/Search
      url: 'VillagesMgmt/DigitalStandardCategories/Search$_params',
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
      // edit from Centers/Search to VillagesMgmt/Centers/Search
      url: 'VillagesMgmt/Centers/Search$_params',
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
      // edit from Contacts/Search to Security/Contacts/Search
      url: 'Security/Contacts/Search$_params',
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
      // edit from Villages/Search to VillagesMgmt/Villages/Search
      url: 'VillagesMgmt/Villages/Search$_params',
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
    final params = '?contactId=$contactId&PageNumber=1';
    var request = HttpRequest(method: HttpMethod.get, url: 'ContactImages/Search$params',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<GalleryModel>.from(
          json.decode(resp.data!).map((x) => GalleryModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<TimelinePostModel>?> getTimelinePosts({bool? isApproved, int? pageNumber, int? pageSize, String? orderBy}) async{
    var request = HttpRequest(method: HttpMethod.get,
      //   // edit from UserPosts/Search to Timeline/UserPosts/Search
      url: 'Timeline/UserPosts/Search?isApproved=true&ForApp=true&OrderBy=date%20desc',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<TimelinePostModel>.from(json.decode(resp.data!).map((x) => TimelinePostModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<MyVillageModel?> getMyVillage(String? villageId) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Villages to VillagesMgmt/Villages
      url: 'VillagesMgmt/Villages/$villageId?forapp=true',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return MyVillageModel()..deserialize(resp.data!);
    }
    return null;
  }

  @override
  Future postPrayingForMartyrs(MartyrsPrayersRequest? requestModel) async{
    var request = HttpRequest(method: HttpMethod.post,
        // edit from MartyrsPrayers to UserMartyrsPrayers
        url: 'UserMartyrsPrayers', data: requestModel)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return jsonDecode(resp.data!);
    }
    return null;
  }

  @override
  Future<List<QuestionResponse>?> getQuestions({String? userId}) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from UserQuestion to Questions/UserQuestion
      url: 'Questions/UserQuestion/$userId',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<QuestionResponse>.from(json.decode(resp.data!).map((x) => QuestionResponse()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<UserPointsResponse?> getUserPoints({String? userId}) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from UserPoints to Membership/UserPoints
      url: 'Membership/UserPoints/$userId',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return UserPointsResponse()..deserialize(resp.data!);
    }
    return null;
  }

  @override
  Future postAnswer(AnswerRequest? answerRequest) async{
    var request = HttpRequest(method: HttpMethod.post,
        // edit from UserQuestion/SubmitAnswer to Questions/UserQuestion/SubmitAnswer
        url: 'Questions/UserQuestion/SubmitAnswer', data: answerRequest)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return jsonDecode(resp.data!);
    }
    return null;
  }
}
