import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/details_course/_widgets/about_details_course_view.dart';
import 'package:hayah_karema/app/pages/details_course/_widgets/details_statistic_course_view.dart';
import 'package:hayah_karema/app/pages/details_course/_widgets/study_plan_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import '../../common/themes/app_assets.dart';

class DetailsCourseView extends StatelessWidget {
  final TrainingCourseModel? item;

  DetailsCourseView({Key? key, this.item}) : super(key: key);

  final controller = Get.put(TrainingCourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(
              title: AppText.back,
              backCallBack: () => Get.back(),
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              _buildImageAndNameCourse(),
              Empty(
                height: 30,
              ),
              DetailsStatisticCourseView(item: item),
              Empty(
                height: 24,
              ),
              InformationAboutDetailsCourseView(item: item),
              Empty(
                height: 16,
              ),
              StudyPlanCourseView(item: item),
              _joinNowButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageAndNameCourse() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CarouselSlider(
            items: item!.images
                ?.map((e) =>
                ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      e?.filename ?? '',
                      width: Get.width,
                      height: Get.height / 4,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                            width: Get.width,
                            height: Get.height / 4,
                            padding: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: AppColors.current.dimmedLight),
                            child: Image.asset(AppAssets.logo, color: AppColors.current.dimmed.withOpacity(0.3)));
                      },
                    )))
                .toList(),
            options: CarouselOptions(
                autoPlay: false, enlargeCenterPage: true, aspectRatio: 2.0, enableInfiniteScroll: false),
          ),
        ),
        Empty(
          height: 16,
        ),
        Text(item?.name ?? '',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.bodyLarge?.fontSize,
            )),
      ],
    );
  }

  Widget _joinNowButton() {
    return SizedBox(
      width: Get.width,
      child: Obx(() {
        return BigBtn(
          state: controller.postApiLoading.value ? BtnState.loading : BtnState.active,
          text: AppText.joinNow,
          onPressed: () => controller.getAvailableCourses(programId: '${item?.id}', programName: item?.name??''),
        );
      }),
    );
  }


}
