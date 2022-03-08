import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/dialog_helper.dart';

class SideMenuController extends GetxController {
  final menuItems = <MenuItem>[].obs;
  final cacheManager = DI.find<ICacheManager>();
  final _userData = UserData().obs;

  UserData? get userData => _userData.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    //
    await _getUserData();
    //
    initMenuItems();
  }

  Future<void> _getUserData() async {
    await cacheManager.init();
    _userData.value =  cacheManager.getUserData()!;
  }

  void initMenuItems() {
    if(menuItems.isNotEmpty)menuItems.clear();

    /// == Home
    menuItems.add(MenuItem(
        name: AppText.homePage,
        icon: Icons.home,
        onTap: () {
          Get.toNamed(Routes.HOME);
        }));

    /// == my village
    menuItems.add(MenuItem(
        name: AppText.myVillage,
        icon: Icons.holiday_village,
        onTap: () {
          // Get.toNamed(Routes.HOME);
        }));

    /// == honor files
    menuItems.add(MenuItem(
        name: AppText.honorFiles,
        icon: Icons.file_copy_sharp,
        isExpandable: true,
        onTap: () {

        }));

    /// == homeland martyrs
    menuItems.add(MenuItem(
        name: AppText.homelandMartyrs,
        onTap: () {
          Get.toNamed(Routes.HOMELAND_MARTYRS);
        }));

    /// == PROFICIENTS
    menuItems.add(MenuItem(
        name: AppText.proficients,
        onTap: () {
          Get.toNamed(Routes.PROFICIENTS);
        }));

    /// == creators
    menuItems.add(MenuItem(
        name: AppText.creators,
        onTap: () {
          Get.toNamed(Routes.CREATORS);
        }));

    /// == shop
    menuItems.add(MenuItem(
        name: AppText.shop,
        icon: Icons.shopping_cart,
        onTap: () {

        }));

    /// == rewards
    menuItems.add(MenuItem(
        name: AppText.rewards,
        icon: Icons.star,
        onTap: () {

        }));

    /// == Sponsor
    menuItems.add(MenuItem(
        name: AppText.sponsors,
        icon: Icons.supervised_user_circle_sharp,
        onTap: () {
          Get.toNamed(Routes.TOP_COMPANIES);
        }));

    /// == Courses
    menuItems.add(MenuItem(
        name: AppText.courses,
        icon: Icons.model_training_outlined,
        onTap: () {

        }));

    /// == Settings
    menuItems.add(MenuItem(
        name: AppText.settings,
        icon: Icons.settings,
        onTap: () {

        }));

    /// == Logout
    menuItems.add(MenuItem(
        name: AppText.logout,
        icon: Icons.logout,
        onTap: () async {
          final result = await DialogHelper.showActionDialog(
              yesText: AppText.yes,
              noText: AppText.no,
              title: AppText.attention,
              subTitle: AppText.logoutAttentionText);
          if (result ?? false) {
            /// remove cached user data
            cacheManager.logout();
            /// go back to setup page
            Get.offAndToNamed(Routes.SPLASH_VIEW);
          }
        }));
    menuItems.refresh();
  }
}

class MenuItem {
  String name;
  IconData? icon;
  VoidCallback onTap;
  bool? isExpandable;

  MenuItem({required this.name, this.icon, required this.onTap, this.isExpandable});
}
