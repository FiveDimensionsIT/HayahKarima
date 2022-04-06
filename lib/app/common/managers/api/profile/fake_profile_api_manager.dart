import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';

class FakeProfileAPIManager implements IProfileAPIManager{
 
  @override
  Future<ProfileModel?> getProfileData(String? userId) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<List<UserEarnedPointModel>?> getUserEarnedPoints({String? userId}) {
    // TODO: implement getUserEarnedPoints
    throw UnimplementedError();
  }

 

}