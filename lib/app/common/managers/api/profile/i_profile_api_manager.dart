import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';

abstract class IProfileAPIManager{

  Future<ProfileModel?> getProfileData(String? userId);
  Future<List<UserEarnedPointModel>?> getUserEarnedPoints({String? userId});

}