import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_item.dart';

import 'sponsors_controller.dart';

class SponsorsView extends GetView<SponsersController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(children: [
            /// toolbar
            AppToolbar(title: AppText.sponsors, backCallBack: ()=> Get.back()),
            /// sponsors list
            _buildSponsorsList(),
          ]),
        ));
  }


  Widget _buildSponsorsList() {
    return Expanded(
      child: Obx(() {
        // loading
        if(controller.apiLoading.value) return const Center(child: CircularProgressIndicator());
        // no creators data
        if(controller.sponsorsList.isEmpty) return const Center(child: EmptyResponse());
        // display creators list
        return GridView.count(
            padding: AppTheme.pagePadding,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: List.generate(controller.sponsorsList.length, (index) {
              return GridItemView(
                  model: GenericModel(
                      title: controller.sponsorsList[index].userName,
                      subTitle: controller.sponsorsList[index].email,
                      imgPath: controller.sponsorsList[index].avatar,
                      callBack: () {
                       controller.launchUrl(controller.sponsorsList[index].email);
                      }));
            }));
      }),
    );
  }
}
