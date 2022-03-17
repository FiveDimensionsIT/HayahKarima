import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class StatisticCourseView  extends GetView<TrainingCourseController> {
   StatisticCourseView ({Key? key,required this.index}) : super(key: key);
   int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildNumberOfHours(index),
        Empty(width: 8,),
        _buildNumberOfSection(index),
        Empty(width: 8,),
        _buildRate(index),

      ],
    );
  }

  Widget _buildNumberOfHours(int index){
    return Container(
      width: 96,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.current.primary.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/time_line.png',width: 20,height: 20,
          fit: BoxFit.cover,
          ),
          Empty(width: 4,),
          Text(controller.foundCourses.value[index].hourCourse,style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.current.primary
          ),)
        ],
      ),
    );
  }
  Widget _buildNumberOfSection(index){
    return Container(
      width: 96,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.current.primary.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/chapter.png',width: 20,height: 20,
            fit: BoxFit.cover,
          ),
          Empty(width: 4,),
          Text(controller.foundCourses.value[index].sectionCourse,style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.primary
          ),)
        ],
      ),
    );
  }
  Widget _buildRate(index){
    return Container(
      width: 64,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.current.accent.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Text(controller.foundCourses.value[index].rate.toString(),style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.accent
          ),

          ),
          Empty(width: 4,),

          Image.asset('assets/icons/rate.png',width: 20,height: 20,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
