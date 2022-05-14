import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class StudyPlanCourseItem extends StatelessWidget {
  final int index;
  final TrainingCourseModel? item;
  final String details;
  const StudyPlanCourseItem({Key? key,
    required this.index,
    required this.item,
    required this.details,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: AppTheme.pagePadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: AppColors.current.primary.withOpacity(0.1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item?.outlines![index]?.title??'',
              style: TextStyle(
                fontSize: Get.textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Empty(height: 16,),
            Text(details,
              style: TextStyle(
                fontSize: Get.textTheme.bodyMedium?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
