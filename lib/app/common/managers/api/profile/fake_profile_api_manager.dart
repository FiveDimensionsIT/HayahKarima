import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_point.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_profile.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manger.dart';

class FakeProfileApiManger implements IProfileApiManager{

  @override
  Future<UserProfile>? getInfo(UserData userId) async{
    await Future.delayed(const Duration(seconds: 2));
    return UserProfile();
  }

  @override
  Future<UserPoint>? getPoints(UserData userId)async {
    await Future.delayed(const Duration(seconds: 2));
    return UserPoint();
  }


}