import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/details_course/_widgets/study_plan_course_item.dart';
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
              if(item == null || item?.outlines == null){return const SizedBox();}
              String details = '';
              item?.outlines![index]?.details?.forEach((element) {
                details += '- ${element?.description}.\n';
              });
              return StudyPlanCourseItem(
                  index: index,
                  item: item,
                  details: details);
            }),
      ],
    );
  }
}