import 'package:hayah_karema/app/common/managers/api/rewards/_model/replacing_reward.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/reward_model.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/i_rewards_api_manager.dart';

class FakeRewardsApiManager implements IRewardsApiManager {
  @override
  Future<List<RewardModel>?> getRewards() async {
    await Future.delayed(const Duration(seconds: 2));
    return [RewardModel()];
  }

  @override
  Future replacingReward(ReplacingReward? replacingReward) async{
    await Future.delayed(const Duration(seconds: 2));
   return {"message": "test any message here"};
  }
}
