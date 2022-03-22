import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_point.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_profile.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manger.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class ProfileApiManger implements IProfileApiManager{

  final IHttpService _httpService;

  ProfileApiManger(this._httpService);


  @override
  Future<UserProfile>? getInfo(UserData userId) async{
    final _params = '?id=${userId.id}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Contacts/$_params',
    )..addJsonHeaders();

    var resp = await _httpService.sendRequest(request);

    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return UserProfile()..deserialize(resp.data!);
    }
    else {
      return throw Exception();
    }
  }

  @override
  Future<UserPoint>? getPoints(UserData userId) async{
    final _params = '?id=${userId.id}';
    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'UserPoints/{userId}$_params',
    )..addJsonHeaders();

    var resp = await _httpService.sendRequest(request);

    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return UserPoint()..deserialize(resp.data!);
    }
    else {
      return throw Exception();
    }
  }



}