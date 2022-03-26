import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class ProfileController extends GetxController  with GetSingleTickerProviderStateMixin{

  final cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IHomeApiManager>();
  final _profileApiManager = DI.find<IProfileAPIManager>();
  final _action = ActionCenter();

  String? name, nationalId,title,email,phone,address;
  var loginLoading = false.obs;
  final pointsApiLoading = false.obs;
  final profileApiLoading = false.obs;

  late TabController tabBarController;
  var currentTabIndex = 0.obs;

  Rx<UserPointsResponse> userPointsResponse = UserPointsResponse().obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;

  UserData? userData;

  @override
  void onInit() {
    super.onInit();
    tabBarController = TabController(length: 5, vsync: this);
    _getUserData();
  }

  Future<void> _getUserData() async {
    await cacheManager.init();
    userData = cacheManager.getUserData();
    // call APIs
    _getProfileData();
    _getUserPointsAPI();
  }

  @override
  void onClose() {
    tabBarController.dispose();
    super.onClose();
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
}
