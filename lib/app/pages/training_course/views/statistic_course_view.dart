import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class StatisticCourseView extends GetView<TrainingCourseController> {
  final TrainingCourseModel item;

  const StatisticCourseView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCourseStatisticsItem(
            imgPath: 'assets/icons/time_line.png',
            color: AppColors.current.primary.withOpacity(0.1),
            title: item.hourCourse??''),
        Empty(
          width: 8,
        ),
        _buildCourseStatisticsItem(
            imgPath: 'assets/icons/chapter.png',
            color: AppColors.current.primary.withOpacity(0.1),
            title: item.sectionCourse??''),
        Empty(
          width: 8,
        ),
        _buildCourseStatisticsItem(
            imgPath: 'assets/icons/rate.png', color: AppColors.current.accent.withOpacity(0.1), title: "${item.rate}"),
      ],
    );
  }

  Widget _buildCourseStatisticsItem({required String imgPath, required String title, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          Empty(
            width: 4,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: Get.textTheme.bodySmall?.fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.current.primary),
          )
        ],
      ),
    );
  }

}
