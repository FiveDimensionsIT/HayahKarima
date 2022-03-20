import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_view.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/dialog_helper.dart';

class SideMenuController extends GetxController {
  final menuItems = <MenuItem>[].obs;
  final cacheManager = DI.find<ICacheManager>();
  final _userData = UserData().obs;
  var honorFilesExpanded = false.obs;

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
        iconPath: AppAssets.homeSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.HOME);
        }));

    /// == my village
    menuItems.add(MenuItem(
        name: AppText.myVillage,
        iconPath: AppAssets.villageSideMenuIcon,
        onTap: () {
          Get.to(()=> GridDetails(), arguments: {
            'ContactsEnum': ContactsEnum.myVillage,
            "PointerItemModel": null
          });
        }));

    /// == honor files
    menuItems.add(MenuItem(
        name: AppText.honorFiles,
        iconPath: AppAssets.honorbordSideMenuIcon,
        isExpandable: true,
        onTap: () {
          honorFilesExpanded.value = !honorFilesExpanded.value;
          honorFilesExpanded.refresh();
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
        iconPath: AppAssets.marketSideMenuIcon,
        onTap: () {

        }));

    /// == rewards
    menuItems.add(MenuItem(
        name: AppText.rewards,
        iconPath: AppAssets.awardsSideMenuIcon,
        onTap: () {

        }));

    /// == Sponsor
    menuItems.add(MenuItem(
        name: AppText.sponsors,
        iconPath: AppAssets.partnersSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.TOP_COMPANIES);
        }));

    /// == Courses
    menuItems.add(MenuItem(
        name: AppText.courses,
        iconPath: AppAssets.coursesSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.TRAINING_COURSE);
        }));

    /// == Settings
    menuItems.add(MenuItem(
        name: AppText.settings,
        iconPath: AppAssets.settingsSideMenuIcon,
        onTap: () {

        }));

    /// == Logout
    menuItems.add(MenuItem(
        name: AppText.logout,
        iconPath: AppAssets.logoutSideMenuIcon,
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
  String? iconPath;
  VoidCallback onTap;
  bool? isExpandable;

  MenuItem({required this.name, this.iconPath, required this.onTap, this.isExpandable});
}
