import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/home/views/timeline_question_item_view.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/app/pages/home/views/time_line_item_view.dart';
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
            return Column(
              children: [
                TimelineItemView(item: controller.timelinePostsList[index]),

                if(index==1)Obx(() {
                  if (controller.questionApiLoading.value || controller.questionsList.isEmpty) return const SizedBox();
                  return Column(
                    children: [
                      Empty(height: 10),
                      TimelineQuestionItemView(questions: controller.questionsList),
                    ],
                  );
                }),
              ],
            );
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
        child: Text(
          AppText.whatIsInYourMind,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.current.dimmed.withOpacity(0.5),
          ),
        ),
      ),
    );
  }


  Widget _buildUserPoints() {
    return Obx(() {
      if (controller.pointsApiLoading.value || controller.availablePoints.value.isEmpty) return const SizedBox();
      var reversedList = List.from(controller.availablePoints.value
          .split('')
          .map((ch) => ch)
          .toList()
          .reversed);
      return Row(children: reversedList.map((ch) => _buildPointsItem(ch)).toList(),);
    });
  }
}
