import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/add_user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/change_password_request.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/register_user_response.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/user_status_request.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/models/global_status_response.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class UserApiManager implements IUserApiManager {

  final IHttpService _httpService;

  UserApiManager(this._httpService);

  @override
  Future<List<PointerItemModel>?> getAllUsers(String? userId) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Contacts/Search to Security/Contacts/Search
      url: 'Security/Contacts/Search?createdBy=$userId&statusId=2&ForApp=true',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<PointerItemModel>.from(json.decode(resp.data!).map((x) => PointerItemModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<RegisterUserResponse?> registerUser(AddUserData userData) async{
    var request = HttpRequest(method: HttpMethod.post,
        // edit from Contacts to Security/Contacts
        url: 'Security/Contacts',data: userData)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return RegisterUserResponse()..deserialize(resp.data!);
    }
    return null;
  }

  @override
  Future<List<LookupModel>?> educationStatusLookup() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from ContactEducationalStatus/Search to Security/ContactEducationalStatus/Search
      url: 'Security/ContactEducationalStatus/Search',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<LookupModel>?> genderLookup() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from ContactGender/Search to Security/ContactGender/Search
      url: 'Security/ContactGender/Search',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<LookupModel>?> healthStatusLookup() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from ContactHealthStatus/Search to Security/ContactHealthStatus/Search
      url: 'Security/ContactHealthStatus/Search',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }


  @override
  Future<List<LookupModel>?> governoratesLookup() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Governorates/Search to VillagesMgmt/Governorates/Search
      url: 'VillagesMgmt/Governorates/Search?statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<LookupModel>?> centersLookup(String id) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Centers/Search to VillagesMgmt/Centers/Search
      url: 'VillagesMgmt/Centers/Search?governorateId=$id&statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }



  @override
  Future<List<LookupModel>?> villagesLookup(String id) async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Villages/Search to VillagesMgmt/Villages/Search
      url: 'VillagesMgmt/Villages/Search?centerId=$id&statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }


  @override
  Future<GlobalStatusResponse?> changePassword(ChangePasswordRequest changePasswordRequest) async{
    var request = HttpRequest(method: HttpMethod.put,
        // edit from Users/ChangePassword to Security/Users/ChangePassword
        url: 'Security/Users/ChangePassword/${changePasswordRequest.contactId}',data: changePasswordRequest)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return GlobalStatusResponse()..deserialize(resp.data!);
    }
    return null;
  }

  @override
  Future<GlobalStatusResponse?> updateUserStatus(UserStatusRequest userStatusRequest) async{
    var request = HttpRequest(method: HttpMethod.put,
        // edit from Contacts/UpdateStatus to Security/Contacts/UpdateStatus
        url: 'Security/Contacts/UpdateStatus/${userStatusRequest.id}',data: userStatusRequest)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return GlobalStatusResponse()..deserialize(resp.data!);
    }
    return null;
  }

  @override
  Future<List<LookupModel>?> contactStatusLookup() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Status/Search to Lookups/Status/Search
      url: 'Lookups/Status/Search',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

}