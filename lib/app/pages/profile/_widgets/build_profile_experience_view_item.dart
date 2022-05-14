import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class BuildProfileExperienceViewItem extends StatelessWidget {
  const BuildProfileExperienceViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            ClipOval(
              child: Container(
                width: Get.width / 7,
                height: Get.width / 7,
                color: AppColors.current.primaryLight.withOpacity(0.2),
                child: Image.network(
                  '',
                  errorBuilder: (_, __, ___) {
                    return SvgPicture.asset(AppAssets.comapnyPlaceholderIcon, fit: BoxFit.cover,);
                  },
                ),
              ),
            )
          ],
        ),

        const SizedBox(width: 16,),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'شركة الابعاد الخمسة لتقنية المعلومات',
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5,),

            Text(
              'رئيس مجلس الإدارة',
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: Get.textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5,),

            Text(
              'فبراير 2022 : حتى الان ',
              style: TextStyle(
                  color: AppColors.current.primary,
                  fontSize: Get.textTheme.bodySmall?.fontSize),
            ),
          ],
        ),
      ],
    );
  }
}
