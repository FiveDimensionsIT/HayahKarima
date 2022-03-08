import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';

class HomeView extends GetView<HomeController> {

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

          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return  SizedBox(child: Center(child: Text('HOME PAGE', style: Get.textTheme.headline1,)));
  }

}
