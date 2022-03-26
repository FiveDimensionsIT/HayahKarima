import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';

abstract class IProfileAPIManager{

  Future<ProfileModel?> getProfileData(String? userId);

}