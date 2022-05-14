import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/home/_widgets/build_time_line_list_home.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class HomeView extends StatelessWidget {
  var controller = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenuView(),
      backgroundColor: AppColors.current.neutral,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// toolbar.
          _buildToolbar(),
          _buildBodyView(),
        ],
      ),
    );
  }

  AppToolbar _buildToolbar() {
    return AppToolbar(
      title: AppText.homePage,
      actions: Row(
        children: [
          _buildUserPoints(),
          _buildNotificationIcon(),
        ],
      ),
      drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
    );
  }

  IconButton _buildNotificationIcon() {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      onPressed: () {
        Get.toNamed(Routes.NOTIFICATION);
      },
      icon: Icon(
        Icons.notification_important_outlined,
        color: AppColors.current.primary,
        size: 25,
      ),
    );
  }

  Widget _buildPointsItem(String title) {
    return Container(
      width: 22,
      height: 30,
      margin: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.current.accent), borderRadius: BorderRadius.circular(7)),
      child: Center(child: Text(title, style: TextStyle(
          fontSize: Get.textTheme.bodySmall?.fontSize, fontWeight: FontWeight.bold, color: AppColors.current.accent),)),
    );
  }

  Widget _buildBodyView() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: ()=> controller.onRefresh(),
        child: SingleChildScrollView(
          child: Padding(
            padding: AppTheme.pagePadding,
            child: Column(
              children: [
                _buildWhatThink(),
                Empty(height: 10),
                _buildTimelineList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineList() {
    return Obx(() {
      if (controller.postApiLoading.value) return const Center(child: CircularProgressIndicator());
      if (controller.timelinePostsList.isEmpty) return const Center(child: EmptyResponse());
      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (cxt, index) {
            return BuildTimeLineListHome(index: index);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10,),
          itemCount: controller.timelinePostsList.length);
    });
  }

  Widget _buildWhatThink() {
    return GestureDetector(
      onTap: () => controller.goToNewPostView(),
      child: Container(
        width: Get.width,
        padding: AppTheme.pagePadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.current.accent, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppText.whatIsInYourMind,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.current.dimmed.withOpacity(0.5),
              ),
            ),

            Text(
              '(10 نقاط)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.current.dimmed.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildUserPoints() {
    return Obx(() {
      if (controller.pointsApiLoading.value) return const SizedBox(height: 25, width : 25,child: CircularProgressIndicator(strokeWidth: 2.5,));
      if (controller.availablePoints.value.isEmpty) return const SizedBox();
      var reversedList = List.from(controller.availablePoints.value
          .split('')
          .map((ch) => ch)
          .toList()
          .reversed);
      return Row(children: reversedList.map((ch) => _buildPointsItem(ch)).toList(),);
    });
  }
}
