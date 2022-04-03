import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/coursce/_model/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/details_course/views/about_details_course_view.dart';
import 'package:hayah_karema/app/pages/details_course/views/details_statistic_course_view.dart';
import 'package:hayah_karema/app/pages/details_course/views/study_plan_course_view.dart';
import 'package:hayah_karema/app/pages/details_course/views/what_learn_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class DetailsCourseView extends StatelessWidget {

   DetailsCourseView({Key? key}) : super(key: key);
   var controller = Get.find<TrainingCourseController>();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body:SafeArea(
        child: Column(
          children: [
            AppToolbar(title:AppText.back, backCallBack: () => Get.back(),),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(){
    return Expanded(
        child: SingleChildScrollView(
           child: Padding(
             padding: AppTheme.pagePadding,
             child: Column(
               children: [
                 _buildImageAndNameCourse(),
                 Empty(height: 30,),
                // _buildTrainerInfo(),
                // Empty(height: 24,),
                  DetailsStatisticCourseView(item: controller.coursesList[0],),
                 Empty(height: 24,),
                  InformationAboutDetailsCourseView(item: controller.coursesList[0],),
                 Empty(height: 16,),
                  WhatLearnCourseView(),
                 Empty(height: 16,),
                 StudyPlanCourseView(),
                 _joinNowButton()
               ],
             ),
           ),
        ),
    );
  }

  Widget _buildImageAndNameCourse(){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: Get.width,
              height: Get.height/4,

          ),
        ),
        Empty(height: 16,),
        Text(controller.coursesList[0].name??'',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.bodyLarge?.fontSize,
            )
        ),
      ],
    );
  }
  // Widget _buildTrainerInfo(){
  //   return Row(
  //     children: [
  //       CircleAvatar(
  //         backgroundColor: AppColors.current.transparent,
  //         radius: 24,
  //         backgroundImage: AssetImage(item?.imageTrainer??''),
  //       ),
  //       Empty(width: 10,),
  //       Text(item?.trainerName??'',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: Get.textTheme.bodyLarge?.fontSize,
  //           color: AppColors.current.text.withOpacity(0.9),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _joinNowButton() {
    return SizedBox(
      width: Get.width,
      child: BigBtn(
          text: AppText.joinNow,
          onPressed: (){},
      ),
    );
  }
}
