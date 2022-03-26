import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
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

}