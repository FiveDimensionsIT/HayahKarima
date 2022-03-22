import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_point.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_models/user_profile.dart';

abstract class IProfileApiManager{

   Future<UserProfile>? getInfo(UserData userId);

   Future<UserPoint>? getPoints(UserData userId);

  // Future<List<UserProfile>?> getInformationUser(UserData userId);

  // Future<List<UserProfile>?> getEducations(UserData userId);

  // Future<List<UserProfile>?> getPracticalExperience (UserData userId);

  // Future<List<UserProfile>?> getEarnPoints(UserData userId);

  // Future<List<UserProfile>?> getPrizeReplace(UserProfile userProfile);

}