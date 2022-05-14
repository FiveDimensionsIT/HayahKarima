import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/users/_models/add_user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/register_user_response.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/user_model.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class UserApiManager implements IUserApiManager {

  final IHttpService _httpService;

  UserApiManager(this._httpService);

  @override
  Future<List<UserModel>?> getAllUsers() async{
    var request = HttpRequest(method: HttpMethod.get, url: 'ContactHealthStatus/Search',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<UserModel>.from(json.decode(resp.data!).map((x) => UserModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<RegisterUserResponse?> registerUser(AddUserData userData) async{
    var request = HttpRequest(method: HttpMethod.post, url: 'Contacts',data: userData)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'ContactEducationalStatus/Search',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'ContactGender/Search',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'ContactHealthStatus/Search',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'Governorates/Search?statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'Centers/Search?governorateId=$id&statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.get, url: 'Villages/Search?centerId=$id&statusId=2&ForApp=true&OrderBy=name',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<LookupModel>.from(json.decode(resp.data!).map((x) => LookupModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

}