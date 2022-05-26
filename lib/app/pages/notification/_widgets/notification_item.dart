import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';

class NotificationItem extends StatelessWidget {
  final int index;
  const NotificationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: index % 2 == 0 ? AppColors.current.neutral : AppColors.current.primary.withOpacity(0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image:  const DecorationImage(fit: BoxFit.fill, image: AssetImage(AppAssets.userIcon))),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'هناك حقيقة مثبتة منذ زمن طويل وهى ان المحتوى المقروء لصفحة  ',
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.current.text, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '14 الاثنين.فبراير 2022',
                  style: TextStyle(color: AppColors.current.primary, fontSize: Get.textTheme.bodyMedium?.fontSize),
                ),
              ],
            ),
          ),

          DotsView(onClick: (){}),
        ],
      ),
    );
  }
}
