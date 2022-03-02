import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/admin_filtration_page.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/circular_statistic.dart';
import 'package:hayah_karema/app/common/widgets/pointer_item.dart';
import 'package:hayah_karema/app/pages/home/pointer_details_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          /// toolbar.
          AppToolbar(
            title: AppText.digitalCountrysidePointer,
            drawerCallBack: () {},
          ),

          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
        child: SingleChildScrollView(
            child: Stack(
      children: [
        _buildStatistic(),
        _buildPointersList(),
      ],
    )));
  }

  Widget _buildStatistic() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CircularStatistic(
          activeColor: AppColors.current.primary,
          initValue: 50,
          content: Padding(
            padding: EdgeInsets.only(top: Get.width / 4),
            child: Column(
              children: [
                Text(
                  '321456',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.textTheme.headline1?.fontSize),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(AppText.digitalCountrysidePointer),
              ],
            ),
          )),
    );
  }

  Widget _buildPointersList() {
    return Padding(
      padding: EdgeInsets.only(top: Get.width / 1.9),
      child: Obx(() {
        return Column(
          children: [
            const Divider(),

            /// provinces
            _buildPointerItem(
                title: AppText.provincesPointerFilter,
                itemBackGround: AppColors.current.primary,
                list: controller.provincesList,
                onPressMore: () => Get.to(() => PointerDetailsView(
                    title: AppText.provincesPointerFilter,
                    list: controller.provincesList,
                    color: AppColors.current.primary))),

            const SizedBox(
              height: 10,
            ),

            /// centers
            _buildPointerItem(
                title: AppText.centersPointerFilter,
                itemBackGround: AppColors.current.secondary,
                list: controller.centersList,
                onPressMore: () => Get.to(() => PointerDetailsView(
                    title: AppText.centersPointerFilter,
                    list: controller.centersList,
                    color: AppColors.current.secondary))),

            const SizedBox(
              height: 10,
            ),

            /// countryside
            _buildPointerItem(
                title: AppText.countrysidePointerFilter,
                itemBackGround: AppColors.current.error,
                list: controller.countrysidesList,
                onPressMore: () => Get.to(() => PointerDetailsView(
                    title: AppText.countrysidePointerFilter,
                    list: controller.countrysidesList,
                    color: AppColors.current.error))),

            const SizedBox(
              height: 10,
            ),

            /// citizen
            _buildPointerItem(
                title: AppText.citizensPointerFilter,
                itemBackGround: AppColors.current.primary,
                list: controller.citizensList,
                onPressMore: () => Get.to(() => PointerDetailsView(
                    title: AppText.citizensPointerFilter,
                    list: controller.citizensList,
                    color: AppColors.current.primary))),

            const SizedBox(
              height: 10,
            ),

            /// citizen
            _buildPointerItem(
                title: AppText.typesPointerFilter,
                itemBackGround: AppColors.current.secondary,
                list: controller.typesList,
                onPressMore: () => Get.to(() => PointerDetailsView(
                    title: AppText.typesPointerFilter,
                    list: controller.typesList,
                    color: AppColors.current.secondary))),

            const SizedBox(
              height: 16,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPointerItem(
      {required String title,
      required List list,
      required Color itemBackGround,
      required Function onPressMore}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPointerItemTitle(title),
        _buildPointerItemList(list, itemBackGround),
        _buildMoreButton(onPressMore)
      ],
    );
  }

  Padding _buildPointerItemTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: Get.textTheme.headline3?.fontSize,
            color: AppColors.current.text,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  ListView _buildPointerItemList(List<dynamic> list, Color itemBackGround) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (cxt, index) => PointerItem(
              title: list[index]['name'],
              subtitle: list[index]['value'],
              percentage: list[index]['percentage'],
              itemBackGround: itemBackGround,
            ));
  }

  Container _buildMoreButton(Function onPressMore) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.current.dimmedLight.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.current.transparent)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.more,
                style: TextStyle(
                    fontSize: Get.textTheme.bodyText1?.fontSize,
                    color: AppColors.current.text,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.navigate_next,
                size: 30,
              )
            ],
          ),
          onPressed: () => onPressMore(),
        ),
      ),
    );
  }
}
