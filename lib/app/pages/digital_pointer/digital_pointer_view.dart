import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/circular_statistic.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/common/widgets/pointer_item.dart';
import 'package:hayah_karema/app/pages/digital_pointer/_widgets/pointer_details_list.dart';
import 'package:hayah_karema/app/pages/digital_pointer/digital_pointer_controller.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_view.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';

class DigitalPointerView extends GetView<DigitalPointerController> {
  DigitalPointerView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenuView(),
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
            drawerCallBack: () => scaffoldKey.currentState?.openDrawer(),
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
                Obx(() {
                  return Text(
                    formatter.format(controller.statisticNumber.value),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline1?.fontSize),
                  );
                }),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),

            /// provinces
            _buildPointerItem(
                title: AppText.provincesPointerFilter,
                itemBackGround: AppColors.current.primary,
                list: controller.provincesList,
                onPressMore: () =>
                    Get.to(() =>
                        PointerDetailsListView(
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
                onPressMore: () =>
                    Get.to(() =>
                        PointerDetailsListView(
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
                list: controller.villagesList,
                onPressMore: () =>
                    Get.to(() =>
                        PointerDetailsListView(
                            title: AppText.countrysidePointerFilter,
                            list: controller.villagesList,
                            color: AppColors.current.error))),

            const SizedBox(
              height: 10,
            ),

            /// citizen
            _buildPointerItem(
                title: AppText.citizensPointerFilter,
                itemBackGround: AppColors.current.primary,
                list: controller.citizensList,
                onPressMore: () =>
                    Get.to(() =>
                        PointerDetailsListView(
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
                list: controller.categoriesList,
                onPressMore: () =>
                    Get.to(() =>
                        PointerDetailsListView(
                            title: AppText.typesPointerFilter,
                            list: controller.categoriesList,
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
      {required String title, required List list, required Color itemBackGround, required Function onPressMore}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPointerItemTitle(title),
        if (list.isNotEmpty) _buildPointerItemList(list, itemBackGround),
        if (list.isNotEmpty) _buildMoreButton(onPressMore),
        if (list.isEmpty) SizedBox(width: Get.width, child: const Center(child: EmptyResponse())),
      ],
    );
  }

  Padding _buildPointerItemTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.text, fontWeight: FontWeight.bold),
      ),
    );
  }

  ListView _buildPointerItemList(List<dynamic> list, Color itemBackGround) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length > 5 ? 5 : list.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (cxt, index) {
          final maxIndicator = list[0].indicator;
          return PointerItem(
            title: list[index].userName,
            subtitle: formatter.format(list[index].indicator),
            percentage: list[index].percentage(maxIndicator),
            itemBackGround: itemBackGround,
          );
        });
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
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.current.transparent)),
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
