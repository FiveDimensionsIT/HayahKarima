import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/models/enums/user_type.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_view.dart';
import 'package:hayah_karema/app/pages/profile/profile_binding.dart';
import 'package:hayah_karema/app/pages/profile/profile_view.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/dialog_helper.dart';

class SideMenuController extends GetxController {
  final menuItems = <MenuItemModel>[].obs;
  final cacheManager = DI.find<ICacheManager>();
  final _userData = UserData().obs;
  final RxList<GenericModel> userAccounts = <GenericModel>[].obs;
  var honorFilesExpanded = false.obs;

  UserData? get userData => _userData.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    //
    // await _getUserData();
    //
    initMenuItems();
    _getUserAccounts();
  }

  Future<void> _getUserData() async {
    await cacheManager.init();
    _userData.value =  cacheManager.getUserData()!;
  }

  void initMenuItems() {
    if(menuItems.isNotEmpty)menuItems.clear();

    /// == Home
    menuItems.add(MenuItemModel(
        name: AppText.homePage,
        iconPath: AppAssets.homeSideMenuIcon,
        onTap: () {
          if (_userData.value.userRole == UserType.user) {
            Get.toNamed(Routes.HOME);
          } else {
            Get.toNamed(Routes.DIGITAL_POINTER);
          }
        }));

    /// == my village
    if(_userData.value.myVillageVisibility()){
      menuItems.add(MenuItemModel(
          name: AppText.myVillage,
          iconPath: AppAssets.villageSideMenuIcon,
          onTap: () {
            Get.to(()=> GridDetails(), arguments: {
              'ContactsEnum': ContactsEnum.myVillage,
              "PointerItemModel": null
            });
          }));
    }

    /// == honor files
    menuItems.add(MenuItemModel(
        name: AppText.honorFiles,
        iconPath: AppAssets.honorbordSideMenuIcon,
        isExpandable: true,
        onTap: () {
          honorFilesExpanded.value = !honorFilesExpanded.value;
          honorFilesExpanded.refresh();
        }));


    /// == homeland martyrs
    menuItems.add(MenuItemModel(
        name: AppText.homelandMartyrs,
        onTap: () {
          Get.toNamed(Routes.HOMELAND_MARTYRS);
        }));

    /// == birthplace
    menuItems.add(MenuItemModel(
        name: AppText.birthPlace,
        onTap: () {
          Get.toNamed(Routes.BIRTH_PLACE);
        }));

    /// == PROFICIENTS
    menuItems.add(MenuItemModel(
        name: AppText.proficients,
        onTap: () {
          Get.toNamed(Routes.PROFICIENTS);
        }));

    /// == creators
    menuItems.add(MenuItemModel(
        name: AppText.creators,
        onTap: () {
          Get.toNamed(Routes.CREATORS);
        }));

    /// == shop
    menuItems.add(MenuItemModel(
        name: AppText.shop,
        iconPath: AppAssets.marketSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.PRODUCTS_HOME);
        }));

    /// == orders
    menuItems.add(MenuItemModel(
        name: AppText.myOrders,
        iconPath: AppAssets.orders,
        onTap: () {
          Get.toNamed(Routes.ORDERS);
        }));

    /// == rewards
    if(_userData.value.userRole == UserType.user) {
      menuItems.add(MenuItemModel(
          name: AppText.rewards,
          iconPath: AppAssets.awardsSideMenuIcon,
          onTap: () {
            Get.toNamed(Routes.PRIZES);
          }));
    }
    /// == Sponsor
    menuItems.add(MenuItemModel(
        name: AppText.sponsors,
        iconPath: AppAssets.partnersSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.TOP_COMPANIES);
        }));

    /// == Courses
    menuItems.add(MenuItemModel(
        name: AppText.courses,
        iconPath: AppAssets.coursesSideMenuIcon,
        onTap: () {
          Get.toNamed(Routes.TRAINING_COURSE);
        }));

    /// == users
    if(_userData.value.isUsersSideMenuItemVisible()) {
      menuItems.add(MenuItemModel(
          name: AppText.users,
          iconPath: AppAssets.usersSideMenuIcon,
          onTap: () {
            Get.toNamed(Routes.USERS);
          }));
    }

    /// == Settings
    menuItems.add(MenuItemModel(
        name: AppText.settings,
        iconPath: AppAssets.settingsSideMenuIcon,
        onTap: () {

        }));

    /// == Logout
    menuItems.add(MenuItemModel(
        name: AppText.logout,
        iconPath: AppAssets.logoutSideMenuIcon,
        onTap: () async {
          final result = await DialogHelper.showActionDialog(
              yesText: AppText.yes,
              noText: AppText.no,
              title: AppText.attention,
              subTitle: AppText.logoutAttentionText,
              yesColor: AppColors.current.accent,
              noColor: AppColors.current.primary,
          );
          if (result ?? false) {
            /// remove cached user data
            cacheManager.logout();
            /// go back to setup page
            Get.offAndToNamed(Routes.SPLASH_VIEW);
          }
        }));
    menuItems.refresh();
  }


  void _getUserAccounts() {
    userAccounts.assignAll([
      GenericModel(id: 0, title: 'مجدي عادل', subTitle: 'حساب شخصي', imgPath: '', isSelectedObs: true.obs),
      GenericModel(id: 1, title: 'مجدي عادل', subTitle: 'ادارة', imgPath: '', isSelectedObs: false.obs),
      GenericModel(id: 2, title: 'مجدي عادل', subTitle: 'مدير فرع', imgPath: '', isSelectedObs: false.obs)
    ]);

    if(userAccounts.length == 1){
      onChangeAccountBtnClick();
    }
  }

  onAccountItemSelectionChange({required GenericModel account}) {
    userAccounts.firstWhere((a) => a.isSelectedObs?.value == true).isSelectedObs?.value = false;
    userAccounts.firstWhere((a) => a.id == account.id).isSelectedObs?.value = true;
    userAccounts.refresh();
  }

  onChangeAccountBtnClick() {
    Get.back();
    final selectedAccount = userAccounts.firstWhere((a) => a.isSelectedObs?.value == true);
    Get.to(()=> const ProfileView(), binding: ProfileBinding());
  }

}

class MenuItemModel {
  String name;
  String? iconPath;
  VoidCallback onTap;
  bool? isExpandable;

  MenuItemModel({required this.name, this.iconPath, required this.onTap, this.isExpandable});
}
