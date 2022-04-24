import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/dot_view.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_awards_view.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_education_view.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_experience_view.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_info_view.dart';
import 'package:hayah_karema/app/pages/profile/views/profile_points_view.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(
            children: [
              AppToolbar(title: AppText.profile, backCallBack: () => Get.back()),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Column(
            children: [
              _buildProfile(),
              _buildPoint(),
              const SizedBox(height: 16,),
              _buildTab(),
              const SizedBox(height: 16,),
              _buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.current.dimmedLight)),
      child: Obx(() {
        if (controller.profileApiLoading.value) return const Center(child: CircularProgressIndicator());

        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(controller.profileModel.value.avatar ?? '',
                fit: BoxFit.cover,
                width: Get.height / 6,
                height: Get.height / 6,
              ),
            ),

            const SizedBox(height: 8,),

            Text(controller.profileModel.value.fullName ?? '',
              style: TextStyle(fontSize: Get.textTheme.headline2?.fontSize, fontWeight: FontWeight.bold),),

            const SizedBox(height: 5,),

            FittedBox(
              child: Text( '${controller.profileModel.value.village} ، '
                  '${controller.profileModel.value.center} ، '
                  '${controller.profileModel.value.governorate}',
                style: TextStyle(fontSize: Get.textTheme.bodyText1?.fontSize, fontWeight: FontWeight.bold),),
            )
          ],
        );
      }),
    );
  }

  // Build MainPoint
  Widget _buildPoint() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.current.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() {
          if (controller.pointsApiLoading.value) return const Center(child: CircularProgressIndicator());

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPointsItem(iconPath: AppAssets.pointsIcon, title: AppText.points, points: '${controller.userPointsResponse.value.total_points}'),
              const SizedBox(height: 8,),
              _buildPointsItem(iconPath: AppAssets.giftcardIcon, title: AppText.replaceable, points: '${controller.userPointsResponse.value.available_points}'),
              const SizedBox(height: 8,),
              _buildPointsItem(iconPath: AppAssets.doneIcon, title: AppText.replacedPoint, points: '${controller.userPointsResponse.value.exchanged_points}'),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPointsItem({required String iconPath, required String title, required String points}) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, width: 20,),

        const SizedBox(width: 16,),

        Text(title, style: TextStyle(color: AppColors.current.accent, fontSize: Get.textTheme.headline3?.fontSize),),

        const Spacer(flex: 1),

        Text(points, style: TextStyle(color: AppColors.current.accent, fontSize: Get.textTheme.headline3?.fontSize)),
      ],
    );
  }

  /// Build Tabs
  Widget _buildTab() {
    return ButtonsTabBar(
        // controller: controller.tabBarController,
        height: 40,
        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.current.background),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: AppColors.current.primary,
        unselectedBackgroundColor: AppColors.current.primary.withOpacity(0.2),
        unselectedLabelStyle: TextStyle(color: AppColors.current.primary, fontSize: 12, fontWeight: FontWeight.bold,),
        onTap: (index) => controller.currentTabIndex.value = index,
        tabs: [
          Tab(
            text: AppText.information,
          ),
          // Tab(
          //   text: AppText.education,
          // ),
          // Tab(
          //   text: AppText.practicalExperience,
          //   //child: _buildTab(AppText.practicalExperience,width: 90),
          // ),
          Tab(
            text: AppText.earnPoints,
          ),
          Tab(
            text: AppText.replacingPrizes,
          ),
        ]);
  }

  // TabBar view
  Widget _buildTabBarView() {
    return Obx(() {
      if (controller.currentTabIndex.value == 0) {
        return controller.profileApiLoading.value
            ? const Center(child: CircularProgressIndicator(),)
            : ProfileInfoView(profileModel: controller.profileModel.value);
      }
      // if (controller.currentTabIndex.value == 1) return const ProfileEducationView();
      // if (controller.currentTabIndex.value == 2) return const ProfileExperienceView();
      if (controller.currentTabIndex.value == 1) {
        return controller.pointsEarnedApiLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ProfilePointsView(userEarnedList: controller.userEarnedPointModelList,);
      }
      return controller.userRewardsApiLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ProfileAwardsView(userRewardsList: controller.userRewardsModelList,);
    });
  }

}
