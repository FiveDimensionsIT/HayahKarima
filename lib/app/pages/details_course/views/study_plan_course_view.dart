import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class StudyPlanCourseView extends StatelessWidget {
   StudyPlanCourseView({Key? key}) : super(key: key);

   List<StudyPlanCourse> list = [
     StudyPlanCourse(nameUnit: 'الوحدة الاولى', title: 'التعرف على واجهة المستخدم في الووردبريس'),
     StudyPlanCourse(nameUnit: 'الوحدة الثانية', title: 'أساسيات الووردبريس وكيفية إضافة محتوى على الموقع من خلال Gutenberg'),
     StudyPlanCourse(nameUnit: 'الوحدة الثالثة', title: 'التحكم في شكل الموقع و تخصيصه وتطبيق عملي على تنصيب ثيم وتخصيصه'),
   ];
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
            itemCount: list.length,
            itemBuilder: (context,index){
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
                      Text(list[index].nameUnit,
                        style: TextStyle(
                          fontSize: Get.textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Empty(height: 16,),
                      Text(list[index].title,
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

class StudyPlanCourse{
  late String nameUnit;
  late String title;
  StudyPlanCourse({required this.nameUnit, required this.title});
}