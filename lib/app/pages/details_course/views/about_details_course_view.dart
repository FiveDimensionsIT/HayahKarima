import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class InformationAboutDetailsCourseView extends StatelessWidget {
  final TrainingCourseModel? item;
  InformationAboutDetailsCourseView({Key? key, this.item}) : super(key: key);

  final controller = Get.put(TrainingCourseController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.infoAboutCourse,textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: Get.textTheme.headline3?.fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.current.primary
        ),
        ),
        Empty(height: 16,),
        _buildInfoAboutCourse(),
      ],
    );
  }

  Widget _buildInfoAboutCourse(){
    return Text(item?.aboutCourse??'',
    style: TextStyle(
      fontSize: Get.textTheme.bodyLarge?.fontSize,
    ),
    );
  }
}
