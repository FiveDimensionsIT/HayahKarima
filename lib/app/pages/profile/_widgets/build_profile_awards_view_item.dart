import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_rewards.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/utils/DateHelper.dart';

class BuildProfileAwardViewItem extends StatelessWidget {

  final List<UserRewards> userRewardsList;
  final int index;

  const BuildProfileAwardViewItem({Key? key,
  required this.userRewardsList,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              userRewardsList[index].status??'',
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

}
