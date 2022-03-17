import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/build_button_with_icon.dart';
import 'package:hayah_karema/app/pages/home/views/answer_score_view.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/app/pages/home/views/home_details_view.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class HomeView extends StatelessWidget {
  var controller = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //drawer: SideMenuView(),
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
              Empty(height: 24),
              HomeDetailsView(),
              Empty(height: 24,),
              AnswerAndScoreView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhatThink() {
    return GestureDetector(
      onTap: ()=>controller.goToNewPostView(),
      child: Container(
        width: double.infinity,
        height: 136,
        padding: AppTheme.pagePadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: AppColors.current.dimmed.withOpacity(0.5), width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHintThink(),
            const Spacer(flex: 1,),
            _buildAllButtons(),
          ],
        ),
      ),
    );
  }

  // Widget _buildButtonWhatThank() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildButtonThank(
  //           title: AppText.image,
  //           colorIcon: AppColors.current.primary,
  //           width: 104.0,
  //           height: 32,
  //           icon:'assets/icons/image.svg',
  //           color: AppColors.current.primary.withOpacity(0.1),
  //           colorText: AppColors.current.primary,
  //           onPress: () {}),
  //       _buildButtonThank(
  //           title: AppText.activate,
  //           colorIcon: AppColors.current.accent,
  //           width: 90,
  //           height: 32,
  //           icon:'assets/icons/smile.svg',
  //           color: AppColors.current.accent.withOpacity(0.1),
  //           colorText: AppColors.current.accent,
  //           onPress: () {}),
  //       _buildButtonThank(
  //           title: AppText.live,
  //           colorIcon: AppColors.current.error,
  //           width: 90,
  //           height: 32,
  //           icon: 'assets/icons/live.svg',
  //           color: AppColors.current.error.withOpacity(0.1),
  //           colorText: AppColors.current.error,
  //           onPress: () {}),
  //     ],
  //   );
  // }
  //
  // Widget _buildButtonThank({String? title, icon, color,double? width,double? height, onPress, colorIcon, colorText}) {
  //   return Container(
  //     width: width,
  //     height: height,
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: InkWell(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SvgPicture.asset(icon,color: colorIcon,width: 24,height: 24,),
  //           Empty(width: 4,),
  //           Text(title!,
  //             style: TextStyle(
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //                 color: colorText,
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildHintThink(){
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
              title: AppText.image,
              icon: AppAssets.mediaIcon,
              color: AppColors.current.primary,
              onPress: (){}),
          const SizedBox(width: 15,),
          BuildButtonWithIcon(
              title: AppText.activate,
              icon: AppAssets.activitiesIcon,
              color: AppColors.current.accent,
              onPress: () {}),
          const SizedBox(width: 15,),
          BuildButtonWithIcon(
              title: AppText.live,
              icon: AppAssets.liveIcon,
              color: AppColors.current.error,
              onPress: () {}),
        ],
      ),
    );
  }

}



