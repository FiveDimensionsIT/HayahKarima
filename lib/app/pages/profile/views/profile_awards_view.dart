import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_rewards.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/utils/DateHelper.dart';

class ProfileAwardsView extends StatelessWidget {
  final List<UserRewards> userRewardsList;
  const ProfileAwardsView({Key? key,required this.userRewardsList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return _buildReplacePrizeTab();
  }

  Widget _buildReplacePrizeTab() {
    if(userRewardsList.isEmpty){return const EmptyResponse();}
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userRewardsList.length,
        itemBuilder: (context, index)=> _buildAwardItem(index),
        separatorBuilder: (_, __) =>_buildDivider(),);
  }

  Row _buildAwardItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: Get.width / 6,
            height: Get.width / 6,
            color: AppColors.current.dimmedLight.withOpacity(0.2),
            child: Image.network(
              userRewardsList[index].avatar??"",
              errorBuilder: (_, __, ___) {
                return Image.asset(AppAssets.imgNotFound, fit: BoxFit.cover,);
              },
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userRewardsList[index].reward ??"",
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'DDL-QUEST-0002009',
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
             // userRewardsList[index].date ??"",
              getUserRewardDate(userRewardsList[index].date??''),
              style: TextStyle(color: AppColors.current.primary, fontSize: Get.textTheme.bodySmall?.fontSize),
            )
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration:
              BoxDecoration(color: AppColors.current.dimmed.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child:  Center(
              child: Text(
                "${ userRewardsList[index].points ??""}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
        )
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: AppColors.current.primary.withOpacity(0.2),
      thickness: 1,
      endIndent: 8,
      indent: 8,
    );
  }
}
