import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/utils/DateHelper.dart';


class BuildProfilePointsViewItem extends StatelessWidget {

  final List<UserEarnedPointModel> userEarnedList;
  final int index;
  const BuildProfilePointsViewItem({Key? key,
  required this.userEarnedList,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userEarnedList[index].name??'',
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 5,),

            Text(
              userEarnedList[index].code??'',
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5,),

            Text(
              getUserRewardDate(userEarnedList[index].date??''),
              style: TextStyle(
                  color: AppColors.current.primary,
                  fontSize: Get.textTheme.bodySmall?.fontSize),
            )
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: AppColors.current.dimmed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12)
          ),
          child:  Center(
              child:Text(userEarnedList[index].points.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),)),
        )
      ],
    );
  }
}
