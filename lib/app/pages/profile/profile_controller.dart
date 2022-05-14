
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_rewards.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class ProfileController extends GetxController {

  final cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IHomeApiManager>();
  final _profileApiManager = DI.find<IProfileAPIManager>();
  final _action = ActionCenter();

  String? name, nationalId,title,email,phone,address;
  var loginLoading = false.obs;
  final pointsApiLoading = false.obs;
  final pointsEarnedApiLoading = false.obs;
  final profileApiLoading = false.obs;
  final userRewardsApiLoading = false.obs;
  var currentTabIndex = 0.obs;

  Rx<UserPointsResponse> userPointsResponse = UserPointsResponse().obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;
  RxList<UserEarnedPointModel> userEarnedPointModelList = <UserEarnedPointModel>[].obs;
  RxList<UserRewards> userRewardsModelList = <UserRewards>[].obs;
  UserData? userData;

  @override
  void onInit() {
    super.onInit();
    _getUserData();
  }

  Future<void> _getUserData() async {
    await cacheManager.init();
    userData = cacheManager.getUserData();
    // call APIs
    _getProfileData();
    _getUserPointsAPI();
    _getUserEarnedPointsAPI();
    _getUserRewardsAPI();
  }

  void _getUserPointsAPI() async {
    pointsApiLoading.value = true;
    final userData = cacheManager.getUserData();
    UserPointsResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getUserPoints(userId: '${userData?.id}');
    }, checkConnection: true);
    //
    pointsApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        userPointsResponse.value = result!;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
  void _getUserEarnedPointsAPI() async {
    pointsEarnedApiLoading.value = true;
    final userData = cacheManager.getUserData();
    List<UserEarnedPointModel>? result;

    var success = await _action.execute(() async {
      result = await _profileApiManager.getUserEarnedPoints(userId: '${userData?.id}');
    }, checkConnection: true);
    //
    pointsEarnedApiLoading.value = false;
    //
    if (success) {
      if (result != null) {

        if(userEarnedPointModelList.isNotEmpty) userEarnedPointModelList.clear();
        userEarnedPointModelList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
  void _getProfileData() async {
    profileApiLoading.value = true;
    final userData = cacheManager.getUserData();
    ProfileModel? result;
    var success = await _action.execute(() async {
      result = await _profileApiManager.getProfileData('${userData?.id}');
    }, checkConnection: true);
    //
    profileApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        profileModel.value = result!;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  //
  void _getUserRewardsAPI() async {
    userRewardsApiLoading.value = true;
    final userData = cacheManager.getUserData();
    List<UserRewards>? result;
    var success = await _action.execute(() async {
      result = await _profileApiManager.getUserRewards(userId: '${userData?.id}');
    }, checkConnection: true);
    userRewardsApiLoading.value = false;
    if (success) {
      if (result != null) {
        if(userRewardsModelList.isNotEmpty) userRewardsModelList.clear();
        userRewardsModelList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
}
