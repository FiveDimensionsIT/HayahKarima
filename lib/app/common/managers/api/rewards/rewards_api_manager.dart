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
    var request = HttpRequest(method: HttpMethod.get, url: 'Rewards/Search?statusId=2',)..addJsonHeaders();
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
    var request = HttpRequest(method: HttpMethod.post, url: 'UserRewards',data: replacingReward)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      jsonDecode(resp.data!);
    }
    return null;
  }




}