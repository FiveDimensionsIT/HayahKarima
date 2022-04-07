import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_rewards.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class ProfileAPIManager implements IProfileAPIManager{

  final IHttpService _httpService;

  ProfileAPIManager(this._httpService);

  @override
  Future<ProfileModel?> getProfileData(String? userId) async{
    var request = HttpRequest(method: HttpMethod.get, url: 'Contacts/$userId',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return ProfileModel()..deserialize(resp.data!);
    }
    return null;
  }


  @override
  Future<List<UserEarnedPointModel>?> getUserEarnedPoints({String? userId}) async{
    var request = HttpRequest(method: HttpMethod.get, url: 'UserEarnedPoints/$userId',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<UserEarnedPointModel>.from(
          json.decode(resp.data!).map((x) => UserEarnedPointModel()..deserialize(jsonEncode(x))));
    }
    return null;
    }
  //
  @override
  Future<List<UserRewards>?> getUserRewards({String? userId}) async{
    var request = HttpRequest(method: HttpMethod.get, url: 'UserRewards/Search?userId=$userId',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<UserRewards>.from(
          json.decode(resp.data!).map((x) => UserRewards()..deserialize(jsonEncode(x))));
    }
    return null;
  }
  }
