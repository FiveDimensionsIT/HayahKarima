import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/training_course/_widgets/available_course_item.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';

import '../../../common/managers/api/courses/_models/available_course_model.dart';

class AvailableCoursesView extends GetView<TrainingCourseController> {
  final List<AvailableCourseModel> coursesList;

  const AvailableCoursesView({Key? key, required this.coursesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.selectCourseDate.value = '';
    return Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(
            children: [
              /// toolbar
              AppToolbar(title: 'البرامج التدريبية المتاحة', backCallBack: ()=> Get.back()),

              Expanded(
                child: ListView.builder(
                    itemCount: coursesList.length,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    itemBuilder: (cxt, index) => AvailableCourseItem(courseModel: coursesList[index])),
              ),
            ],
          ),
        ));
  }

}
