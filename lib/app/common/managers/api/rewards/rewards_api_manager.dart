import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/rewards/_model/replacing_reward.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/_model/reward_model.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/i_rewards_api_manager.dart';
import 'package:hayah_karema/services/http/http_classes.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class RewardsApiManager implements IRewardsApiManager{
  final IHttpService _httpService;

  RewardsApiManager(this._httpService);

  @override
  Future<List<RewardModel>?> getRewards() async{
    var request = HttpRequest(method: HttpMethod.get,
      // edit from Rewards/Search to Membership/Rewards/Search
      url: 'Membership/Rewards/Search?statusId=2',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<RewardModel>.from(jsonDecode(resp.data!).map((x) => RewardModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future replacingReward(ReplacingReward? replacingReward) async{
    var request = HttpRequest(method: HttpMethod.post,
        // edit from UserRewards to Membership/UserRewards
        url: 'Membership/UserRewards',data: replacingReward)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return jsonDecode(resp.data!);
    }
    return null;
  }




}