import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/common/widgets/loading_design.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_item.dart';

import 'creators_controller.dart';

class CreatorsView extends GetView<CreatorsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(children: [
            /// toolbar
            AppToolbar(title: AppText.creators, backCallBack: () => Get.back()),
            /// creators
            _buildCreatorsList()
          ]),
        ));
  }

  Widget _buildCreatorsList() {
    return Expanded(
      child: Obx(() {
              // loading
              if(controller.apiLoading.value) return const Center(child: CircularProgressIndicator());
              // no creators data
              if(controller.creatorsList.isEmpty) return const Center(child: EmptyResponse());
              // display creators list
              return GridView.count(
                  padding: AppTheme.pagePadding,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                  children: List.generate(controller.creatorsList.length, (index) {

                    return GridItemView(
                        model: GenericModel(
                            title: controller.creatorsList[index].userName,
                            subTitle: 'التصوير الفوتوغرافي',
                            imgPath: controller.creatorsList[index].avatar,
                            callBack: () {}));
                  }));
            }),
    );
  }
}
