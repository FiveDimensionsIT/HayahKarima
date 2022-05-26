import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/build_profile_points_view_item.dart';

class ProfilePointsView extends StatelessWidget {
   final List<UserEarnedPointModel> userEarnedList;
   const ProfilePointsView({Key? key,required this.userEarnedList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEarnPointsTab();
  }

  Widget _buildEarnPointsTab() {
    if(userEarnedList.isEmpty){return const EmptyResponse();}
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userEarnedList.length,
        itemBuilder: (context, index) => BuildProfilePointsViewItem(
            userEarnedList: userEarnedList,
            index: index),
        separatorBuilder: (context, index) => _buildSeparator()
    );
  }

  // Row _buildItem(int index) {
  //   return Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 userEarnedList[index].name??'',
  //                 style: TextStyle(
  //                     color: AppColors.current.text,
  //                     fontSize: Get.textTheme.bodyLarge?.fontSize,
  //                     fontWeight: FontWeight.bold),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //
  //               const SizedBox(height: 5,),
  //
  //               Text(
  //                 userEarnedList[index].code??'',
  //                 style: TextStyle(
  //                     color: AppColors.current.text,
  //                     fontSize: Get.textTheme.bodySmall?.fontSize,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //
  //               const SizedBox(height: 5,),
  //
  //               Text(
  //                 getUserRewardDate(userEarnedList[index].date??''),
  //                 style: TextStyle(
  //                     color: AppColors.current.primary,
  //                     fontSize: Get.textTheme.bodySmall?.fontSize),
  //               )
  //             ],
  //           ),
  //           const Spacer(),
  //           Container(
  //             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             decoration: BoxDecoration(
  //                 color: AppColors.current.dimmed.withOpacity(0.1),
  //                 borderRadius: BorderRadius.circular(12)
  //             ),
  //             child:  Center(
  //                 child:Text(userEarnedList[index].points.toString(),
  //                   style: const TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16
  //                   ),)),
  //           )
  //         ],
  //       );
  // }

  Divider _buildSeparator() {
    return Divider(
          color: AppColors.current.primary.withOpacity(0.2),
          thickness: 1,
          endIndent: 8,
          indent: 8,
        );
  }
}