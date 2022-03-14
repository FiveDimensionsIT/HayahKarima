import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/3dots_view.dart';
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
                child: Image.network(controller.userData?.profileImgUrl ?? '',
                    errorBuilder: (_, __, ___) => Image.asset(AppAssets.userIcon), color: AppColors.current.dimmed),
              ),
            ),

            const SizedBox(width: 20,),

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

            DotsView(onClick: () => Get.toNamed(Routes.PROFILE)),
          ],
        ),
      );
    });
  }

  Expanded _buildMenuList(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView(
          padding: EdgeInsets.zero,
          children: controller.menuItems.map((item) => _buildMenuItem(context, item)).toList(),
        );
      }),
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    if (!controller.honorFilesExpanded.value && item.iconPath == null) return const SizedBox();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      horizontalTitleGap: 0,
      onTap: () {
        if (item.isExpandable == false) Get.back();
        item.onTap();
      },
      title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: item.iconPath == null ? AppColors.current.dimmed.withOpacity(0.1) : AppColors.current.transparent),
          child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize))),
      leading: item.iconPath == null ? const SizedBox() : SvgPicture.asset(item.iconPath??'', color: AppColors.current.accent,),
      trailing: item.isExpandable ?? false ? const Icon(CupertinoIcons.chevron_down) : const SizedBox(),
    );
  }
}
