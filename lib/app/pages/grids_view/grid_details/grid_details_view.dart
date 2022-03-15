import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/dot_view.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/common/widgets/loading_design.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_controller.dart';

class GridDetails extends StatelessWidget {
  GridDetails({Key? key}) : super(key: key);

  final controller = Get.put(GridDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(
              title: controller.contactsEnum == ContactsEnum.myVillage ? AppText.myVillage : AppText.back,
              backCallBack: () => Get.back(),
            ),
            Obx(() {
              if (controller.apiLoading.value == true) return const Expanded(child: LoadingDesign());
              return _buildContent();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
        child: Padding(
      padding: AppTheme.pagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPrefCard(),
            const SizedBox(
              height: 20,
            ),
            if (controller.contactsEnum == ContactsEnum.martyr)
              Column(
                children: [
                  _buildDetailsItem(
                      title: 'تاريخ الوفاة',
                      color: AppColors.current.error,
                      imgPath: AppAssets.dateOfDeathIcon,
                      countValue: controller.pointerItemModel.deathDate),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildDeadMercy(),
                ],
              ),
            if (controller.contactsEnum == ContactsEnum.myVillage)
              Column(
                children: [
                  _buildDetailsItem(
                      title: 'نقاط القرية',
                      color: AppColors.current.accent,
                      imgPath: AppAssets.pointsIcon,
                      countValue: controller.pointerItemModel.villagePoints ?? ''),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildDetailsItem(
                      title: 'السكان',
                      color: AppColors.current.primary,
                      imgPath: AppAssets.peopleIcon,
                      countValue: controller.pointerItemModel.villagePeople ?? ''),
                ],
              ),
            const SizedBox(
              height: 20,
            ),
            if (controller.contactsEnum == ContactsEnum.creator || controller.contactsEnum == ContactsEnum.proficient)
              _buildDetailsItem(
                  imgPath: AppAssets.honorbordSideMenuIcon,
                  title: controller.pointerItemModel.excellenceField ?? '',
                  color: AppColors.current.accent),
            const SizedBox(
              height: 25,
            ),
            _buildGallery(),

            _buildBiography(),
          ],
        ),
      ),
    ));
  }

  Widget _buildPrefCard() {
    final userName = controller.pointerItemModel.userName;
    String name = userName, subTitle = '';
    if (userName != null && userName.contains('-')) {
      name = userName.split('-')[0];
      subTitle = userName.split('-')[1];
      if (subTitle.isNotEmpty) {
        name += '\n$subTitle';
      }
    }

    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.dimmed.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          /// img
          Container(
            padding: const EdgeInsets.all(1),
            width: Get.width / 3,
            height: Get.width / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width / 6),
                border: Border.all(color: AppColors.current.dimmedLight)),
            child: ClipOval(
              child: Image.network(
                controller.pointerItemModel.avatar ?? '',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    AppAssets.userIcon,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

          /// name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: FittedBox(
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline2?.fontSize),
              ),
            ),
          ),

          /// desc
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${controller.pointerItemModel.center}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize),
              ),
              const DotView(),
              Text(
                '${controller.pointerItemModel.village}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeadMercy() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: AppColors.current.primary, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'ادع له بالرحمة',
          style: TextStyle(
              color: AppColors.current.neutral,
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.headline3?.fontSize),
        ),
      ),
    );
  }

  Widget _buildGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معرض الصور',
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildGallerySlider(),
      ],
    );
  }

  Widget _buildGallerySlider() {
    return Obx(() {
      if (controller.galleryApiLoading.value) {
        return SizedBox(
            height: Get.height / 3, width: Get.width, child: const Center(child: CircularProgressIndicator()));
      }

      if (controller.galleryList.isEmpty) {
        return SizedBox(height: Get.height / 3, width: Get.width, child: const EmptyResponse());
      }

      return CarouselSlider(
        options: CarouselOptions(
          height: Get.height / 3,
          initialPage: 0,
          viewportFraction: 0.8,
        ),
        items: controller.galleryList.map((item) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: Get.height / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  ShadowView(
                    child: Image.network(
                      item.filename ?? '',
                      fit: BoxFit.cover,
                      height: Get.height / 3,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: Get.height / 3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage(AppAssets.imgNotFound), fit: BoxFit.contain)),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: AppColors.current.text.withOpacity(0.7),
                        child: Text(
                          (controller.contactsEnum == ContactsEnum.martyr ||
                                  controller.contactsEnum == ContactsEnum.myVillage)
                              ? 'صور تعبر عن مدخل القرية'
                              : (controller.contactsEnum == ContactsEnum.proficient ||
                                      controller.contactsEnum == ContactsEnum.creator)
                                  ? 'صور تعبر عن الشخص صاحب الملف التعريفي'
                                  : '',
                          style: TextStyle(color: AppColors.current.neutral),
                        ),
                      )),
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget _buildBiography() {
    if(controller.pointerItemModel.biography == null || controller.pointerItemModel.biography.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        controller.pointerItemModel.biography ?? '',
        style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildDetailsItem({required Color color, required String imgPath, required String title, String? countValue}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.current.neutral, border: Border.all(color: color), borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset(
            imgPath,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline3?.fontSize),
            ),
          ),
          Text(
            countValue ?? '',
            style: TextStyle(color: color, fontSize: Get.textTheme.headline3?.fontSize),
          ),
        ],
      ),
    );
  }
}
