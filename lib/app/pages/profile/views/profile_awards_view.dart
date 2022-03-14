import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class ProfileAwardsView extends StatelessWidget {
  const ProfileAwardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildReplacePrizeTab();
  }

  Widget _buildReplacePrizeTab() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildAwardItem();
        },
        separatorBuilder: (context, index) {
          return _buildDivider();
        });
  }

  Row _buildAwardItem() {
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
              '',
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
              'هاتف سامسونج',
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
              '14.25 14 . الإثنين . فبراير 2022',
              style: TextStyle(color: AppColors.current.primary, fontSize: Get.textTheme.bodySmall?.fontSize),
            )
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration:
              BoxDecoration(color: AppColors.current.dimmed.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: const Center(
              child: Text(
            '500',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
