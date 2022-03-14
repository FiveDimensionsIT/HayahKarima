import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/common/widgets/loading_design.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_view.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_item.dart';

import 'homeland_martyrs_controller.dart';

class HomelandMartyrsView extends GetView<HomelandMartyrsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(children: [
            /// toolbar
            AppToolbar(title: AppText.homelandMartyrs, backCallBack: () => Get.back()),

            /// homeland martyrs
            _buildMartyrsList(),
          ]),
        ));
  }

  Widget _buildMartyrsList() {
    return Expanded(
      child: Obx(() {
        // loading
        if (controller.apiLoading.value) return const Center(child: CircularProgressIndicator());
        // no martyrs data
        if (controller.martyrsList.isEmpty) return const Center(child: EmptyResponse());
        // display martyrs list
        return GridView.count(
            padding: AppTheme.pagePadding,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: List.generate(controller.martyrsList.length, (index) {
              final userName = controller.martyrsList[index].userName;
              String? name, subTitle;
              if (userName != null && userName.contains('-')) {
                name = userName.split('-')[0];
                if (name.contains(':')) {
                  name = name.split(':')[1];
                }
                subTitle = userName.split('-')[1];
              }

              return GridItemView(
                  model: GenericModel(
                      title: name ?? userName,
                      subTitle: subTitle,
                      imgPath: controller.martyrsList[index].avatar,
                      callBack: () => Get.to(() => GridDetails(
                            pointerItemModel: controller.martyrsList[index],
                            contactsEnum: ContactsEnum.martyr,
                          ))));
            }));
      }),
    );
  }
}
