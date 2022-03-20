import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/build_button_with_icon.dart';
import 'package:hayah_karema/app/pages/home/views/timeline_question_item_view.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/app/pages/home/views/time_line_item_view.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';
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
          AppToolbar(
            title: AppText.homePage,
            drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
          ),
          _buildAlContent(),
        ],
      ),
    );
  }

  Widget _buildAlContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              _buildWhatThink(),
              Empty(height: 20),
              _buildTimelineList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (cxt, index) => index!=0 && index%3 == 0 ? TimelineQuestionItemView():TimelineItemView(),
        separatorBuilder: (_, __) => const SizedBox(height: 10,),
        itemCount: 10);
  }

  Widget _buildWhatThink() {
    return GestureDetector(
      onTap: () => controller.goToNewPostView(),
      child: Container(
        width: double.infinity,
        height: 136,
        padding: AppTheme.pagePadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.current.dimmed.withOpacity(0.5), width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHintThink(),
            const Spacer(
              flex: 1,
            ),
            _buildAllButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHintThink() {
    return Text(
      AppText.whatIsInYourMind,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.current.dimmed.withOpacity(0.5),
      ),
    );
  }

  Widget _buildAllButtons() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildButtonWithIcon(
              title: AppText.image, icon: AppAssets.mediaIcon, color: AppColors.current.primary, onPress: () {}),
          const SizedBox(
            width: 15,
          ),
          BuildButtonWithIcon(
              title: AppText.activate, icon: AppAssets.activitiesIcon, color: AppColors.current.accent, onPress: () {}),
          const SizedBox(
            width: 15,
          ),
          BuildButtonWithIcon(
              title: AppText.live, icon: AppAssets.liveIcon, color: AppColors.current.error, onPress: () {}),
        ],
      ),
    );
  }
}
