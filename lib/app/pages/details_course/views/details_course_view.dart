import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
   DetailsCourseView({Key? key,this.index}) : super(key: key);
   final controller = Get.put(TrainingCourseController());

   int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body:SafeArea(
        child: Column(
          children: [
            AppToolbar(title:AppText.back,
              backCallBack: () => Get.back(),
            ),
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
                 _buildImageAndNameCourse(index),
                 Empty(height: 50,),
                 _buildTrainerInfo(index),
                 Empty(height: 24,),
                 const DetailsStatisticCourseView(),
                 Empty(height: 24,),
                  InformationAboutDetailsCourseView(index: index),
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

  Widget _buildImageAndNameCourse(index){
    return Column(
      children: [
        Image.asset(controller.foundCourses.value[index].image,
            width: 328,
            height: 128,
            fit: BoxFit.cover
        ),
        Empty(height: 16,),
        Text(controller.foundCourses.value[index].nameCourse,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.bodyLarge?.fontSize,
            )
        ),
      ],
    );
  }
  Widget _buildTrainerInfo(index){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.current.transparent,
          radius: 24,
          backgroundImage: AssetImage(controller.foundCourses.value[index].imageTrainer),
        ),
        Empty(width: 10,),
        Text(controller.foundCourses.value[index].trainerName,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: Get.textTheme.bodyMedium?.fontSize,
            color: AppColors.current.text.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

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
