import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/common/widgets/shadow_view.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_controller.dart';

class GridDetails extends StatelessWidget {
  final PointerItemModel pointerItemModel;
  final ContactsEnum contactsEnum;

  GridDetails({Key? key, required this.pointerItemModel, required this.contactsEnum}) : super(key: key);

  final controller = Get.put(GridDetailsController());

  @override
  Widget build(BuildContext context) {
    controller.getGalleryApi(pointerItemModel.id!);
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(
              title: AppText.back,
              backCallBack: () => Get.back(),
            ),
            _buildContent(),
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
          children: [
            _buildPrefCard(),
            const SizedBox(
              height: 20,
            ),
            if (contactsEnum == ContactsEnum.martyr)
              Column(
                children: [
                  _buildDeadDate(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildDeadMercy(),
                ],
              ),
            const SizedBox(
              height: 20,
            ),
            if (contactsEnum != ContactsEnum.martyr) _buildSpecialist(),
            const SizedBox(
              height: 25,
            ),
            _buildGallery(),
          ],
        ),
      ),
    ));
  }

  Widget _buildPrefCard() {
    final userName = pointerItemModel.userName;
    String? name, subTitle;
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
          SizedBox(
            width: Get.width / 3,
            height: Get.width / 3,
            child: ClipOval(
              child: Image.network(
                pointerItemModel.avatar ?? '',
                fit: BoxFit.cover,
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
                '${name ?? userName}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline2?.fontSize),
              ),
            ),
          ),

          /// desc
          Text(
            '${pointerItemModel.center} - ${pointerItemModel.village}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildDeadDate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.accent),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.date_range,
            color: AppColors.current.accent,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'تاريخ الوفاة',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.headline3?.fontSize),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            pointerItemModel.deathDate ?? '',
            style: TextStyle(
                color: AppColors.current.accent,
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.headline4?.fontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialist() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          border: Border.all(color: AppColors.current.accent),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.school,
            color: AppColors.current.accent,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              pointerItemModel.excellenceField ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.current.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.textTheme.headline3?.fontSize),
            ),
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
        const SizedBox(
          height: 10,
        ),
        Text(
          pointerItemModel.biography ?? '',
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildGallerySlider() {
    return Obx(() {
      if (controller.apiLoading.value) return const Center(child: CircularProgressIndicator());

      if (controller.galleryList.isEmpty) return const EmptyResponse();

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
                          decoration:
                              const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.imgNotFound), fit: BoxFit.contain)),
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
                          (contactsEnum == ContactsEnum.martyr)
                              ? 'صور تعبر عن مدخل القرية'
                              : (contactsEnum == ContactsEnum.proficient || contactsEnum == ContactsEnum.creator)
                                  ? 'صور تعبر عن الشخص صاحب الملف التعريفي'
                                  : 'صور تعبر عن الرعاة',
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
}
