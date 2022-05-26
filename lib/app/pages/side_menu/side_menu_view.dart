import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
import 'package:hayah_karema/app/pages/side_menu/_widget/side_menu_item.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

import 'side_menu_controller.dart';

class SideMenuView extends StatelessWidget {
  final controller = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.current.neutral,
      child: SafeArea(
        child: Column(
          children: [
            _buildUserData(),

            Divider(color: AppColors.current.accentLight,),

            _buildMenuList(context),
          ],
        ),
      ),
    );
  }

  Obx _buildUserData() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 15, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(controller.userData?.avatar ?? '',
                    errorBuilder: (_, __, ___) => Image.asset(AppAssets.userIcon)),
              ),
            ),

            const SizedBox(width: 20,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.userData?.fullName ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline3?.fontSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  FittedBox(
                    child: Text('${controller.userData?.village} - ${controller.userData?.governorate}',
                        style: const TextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),

            DotsView(onClick: () {
              // back to home.
              Get.back();
              // then go to profile page.
              Get.toNamed(Routes.PROFILE, arguments: {"user_id": controller.userData?.id});
            }),
          ],
        ),
      );
    });
  }

  Expanded _buildMenuList(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(0),
          children: controller.menuItems.map((item) {
            if (!controller.honorFilesExpanded.value && item.iconPath == null) return const SizedBox();
            return SideMenuItem(itemModel: item,);
          }).toList(),
        );
      }),
    );
  }
}
