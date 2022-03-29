import 'package:hayah_karema/app/common/managers/api/rewards/_model/replacing_reward.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/reward_model.dart';

abstract class IRewardsApiManager {
  Future<List<RewardModel>?> getRewards();
  Future replacingReward(ReplacingReward? replacingReward);
}