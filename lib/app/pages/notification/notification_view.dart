import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/notification/_widgets/notification_item.dart';
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
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) => NotificationItem(index: index));
  }

}
