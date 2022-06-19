import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/change_account_view.dart';
import 'package:hayah_karema/app/pages/side_menu/_widget/side_menu_item.dart';

import 'side_menu_controller.dart';

class SideMenuView extends GetView<SideMenuController> {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.current.neutral,
      child: SafeArea(
        child: Column(
          children: [
            _buildUserData(),
            Divider(
              color: AppColors.current.accentLight,
            ),
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
            const SizedBox(
              width: 20,
            ),
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
            IconButton(
                padding: const EdgeInsets.all(0),
                icon: SvgPicture.asset(AppAssets.manageAccountsIcon),
                iconSize: 20,
                onPressed: () {
                  Get.back();
                  _displayAccountsActionSheet();
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
            return SideMenuItem(
              itemModel: item,
            );
          }).toList(),
        );
      }),
    );
  }

  void _displayAccountsActionSheet() {
    Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: AppColors.current.neutral,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
        child: ChangeAccountsView(
            accounts: controller.userAccounts,
            onAccountItemSelectionChange: ({required GenericModel account}) =>
                controller.onAccountItemSelectionChange(account: account),
            onChangeAccountBtnClick: () => controller.onChangeAccountBtnClick())));
  }
}
