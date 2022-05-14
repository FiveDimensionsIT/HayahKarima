import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/details_course/views/details_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/_widgets/statistic_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class TrainingCourseItemView extends GetView<TrainingCourseController> {
  final TrainingCourseModel item;

  const TrainingCourseItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailsCourseView(item: item,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.current.neutral,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: AppColors.current.primary,
                width: 1.0,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageCourse(),
                Empty(
                  height: 8,
                ),
                _buildCourseName(),
                Empty(
                  height: 10,
                ),
                StatisticCourseView(item: item),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCourse() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        item.images == null || item.images!.isEmpty ? '' : item.images![0]!.filename ?? '',
        width: Get.width,
        height: Get.height / 5,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___){
          return Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.current.dimmedLight),
            width: Get.width,
            height: Get.height / 5,
            child: Image.asset(AppAssets.logo, color: AppColors.current.dimmed.withOpacity(0.3),),
          );
        },
      ),
    );
  }

  Widget _buildCourseName() {
    return Text(
      item.name ?? '',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: Get.textTheme.bodyMedium?.fontSize,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

}
