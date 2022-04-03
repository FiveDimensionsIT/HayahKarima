import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/replacing_reward.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/reward_model.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/i_rewards_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class PrizesController extends GetxController {
  final _cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IRewardsApiManager>();
  final _action = ActionCenter();
  var getApiLoading = false.obs;
  RxList<RewardModel> rewardsList = <RewardModel>[].obs;

  @override
  void onInit() async{
    super.onInit();
    _getRewards();
    await _cacheManager.init();
  }

  Future<void> onRefresh() async {
    _getRewards();
  }

  void _getRewards() async {
    getApiLoading.value = true;
    List<RewardModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getRewards();
    }, checkConnection: true);
    //
    getApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        rewardsList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void replacingReward(RewardModel model) async {
    model.isReplacingBtnLoading.value = true;
    final userData = _cacheManager.getUserData();
    ReplacingReward replacingReward = ReplacingReward(date: DateTime.now().toIso8601String(), points: model.requiredPoints, userId: userData?.id, rewardId: model.id);

    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.replacingReward(replacingReward);
    }, checkConnection: true);
    //
    model.isReplacingBtnLoading.value = false;
    //
    if (success) {
      if (result != null) {
        OverlayHelper.showSuccessToast(result["message"]);
        Get.find<HomeController>().onRefreshUserPoints();
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }



}
