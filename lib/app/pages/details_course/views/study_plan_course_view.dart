import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class StudyPlanCourseView extends StatelessWidget {
  final TrainingCourseModel? item;
   const StudyPlanCourseView({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.studyPlan,
          style: TextStyle(
              fontSize: Get.textTheme.headline3?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.primary
          ),
        ),
        Empty(height: 8,),

        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: item?.outlines?.length??0,
            itemBuilder: (context,index){
              String details = '';
              item?.outlines![index]?.details?.forEach((element) {
                details += '- ${element?.description}.\n';
              });
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
            }),
      ],
    );
  }
}