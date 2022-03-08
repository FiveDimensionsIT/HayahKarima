import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';

import 'side_menu_controller.dart';

class SideMenuView extends StatelessWidget {
  final controller = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.current.neutral,
      child: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              _buildUserData(),
              const Divider(),
              _buildMenuList(context),
            ],
          );
        }),
      ),
    );
  }

  Obx _buildUserData() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 15, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(controller.userData?.profileImgUrl ?? '',
                    errorBuilder: (_, __, ___) => Image.asset(AppAssets.userIcon), color: AppColors.current.dimmed),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.userData?.name ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline3?.fontSize),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(controller.userData?.village ?? '',
                      style: const TextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),

            InkWell(
              //////////////////65//////////
              //onTap: ()=> Get.toNamed(Routes.PROFILE),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.current.dimmedLight),
                child: const Icon(CupertinoIcons.settings),
              ),
            )
          ],
        ),
      );
    });
  }

  Expanded _buildMenuList(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: controller.menuItems.map((item) => _buildMenuItem(context, item)).toList(),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      horizontalTitleGap: 0,
      onTap: () {
        if(item.isExpandable == false) Get.back();
        item.onTap();
      },
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: item.icon == null ? AppColors.current.dimmed.withOpacity(0.1): AppColors.current.transparent),
          child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize))),
      leading: item.icon == null ? const SizedBox() : Icon(item.icon, color: AppColors.current.accent,),
      trailing: item.isExpandable??false? const Icon(CupertinoIcons.chevron_down): const SizedBox(),
    );
  }
}
