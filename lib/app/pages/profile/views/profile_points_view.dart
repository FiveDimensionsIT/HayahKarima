import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class ProfilePointsView extends StatelessWidget {
  const ProfilePointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildEarnPointsTab();
  }

  Widget _buildEarnPointsTab() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildItem();
        },
        separatorBuilder: (context, index) {
          return _buildSeparator();
        },);
  }

  Row _buildItem() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إجابة سؤال',
                  style: TextStyle(
                      color: AppColors.current.text,
                      fontSize: Get.textTheme.bodyLarge?.fontSize,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 5,),

                Text(
                  'DDL-QUEST-0002009',
                  style: TextStyle(
                      color: AppColors.current.text,
                      fontSize: Get.textTheme.bodySmall?.fontSize,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5,),

                Text(
                  '14.25 14 . الإثنين . فبراير 2022',
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
              child: const Center(
                  child: Text('50',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),)),
            )
          ],
        );
  }

  Divider _buildSeparator() {
    return Divider(
          color: AppColors.current.primary.withOpacity(0.2),
          thickness: 1,
          endIndent: 8,
          indent: 8,
        );
  }
}
