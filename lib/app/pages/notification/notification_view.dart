import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/notification/notification_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import '../../common/themes/app_colors.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
        length: controller.tabList.length,
        child: Scaffold(
          backgroundColor: AppColors.current.neutral,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(136),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppToolbar(
                    title: AppText.notification,
                    backCallBack: () {},
                  ),
                  Empty(
                    height: 16,
                  ),
                  TabBar(
                    indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    onTap: (index)=> controller.onTabClick(index),
                    tabs: controller.tabList
                        .map(
                          (item) => Container(
                              decoration: BoxDecoration(
                                  color: item.isSelected == true
                                      ? AppColors.current.accentLight
                                      : AppColors.current.accentLight.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(item.title??'', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: item.isSelected == false
                                  ? AppColors.current.accentLight
                                  : AppColors.current.neutral),)),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          body: _contentNotification(),
        ),
      );
    });
  }

  Widget _contentNotification() {
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (_, __) => const Divider(
              height: 1,
            ),
        itemBuilder: (context, index) {
          return _buildNotificationItem(index);
        });
  }

  Widget _buildNotificationItem(int index) {
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
                image: const DecorationImage(fit: BoxFit.fill, image: AssetImage(AppAssets.userIcon))),
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
