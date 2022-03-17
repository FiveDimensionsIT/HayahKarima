import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/details_course/views/details_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/app/pages/training_course/views/statistic_course_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class CourseInformationView extends GetView<TrainingCourseController> {
  const CourseInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:controller.foundCourses.value.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Get.to(DetailsCourseView(index: index),);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.current.neutral,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: AppColors.current.primary,
                        width: 1.0,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageCourse(index),
                        Empty(height: 8,),
                        _buildTrainee(index),
                        Empty(height: 4,),
                        _buildCourseName(index),
                        Empty(height: 4,),
                         StatisticCourseView(index: index,),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }

  Widget _buildImageCourse(int index){
    return Image.asset(controller.foundCourses.value[index].image,
      width: 312,
      height: 128,
      fit: BoxFit.cover,
    );
  }
  Widget  _buildTrainee(int index){
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.current.transparent,
            radius: 18,
            backgroundImage: AssetImage(controller.foundCourses.value[index].imageTrainer),
          ),
           Empty(width: 16,),
           Text(controller.foundCourses.value[index].trainerName,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: Get.textTheme.bodyLarge?.fontSize,
              color: AppColors.current.text.withOpacity(0.9),
            ),
          ),
          const Spacer(flex: 1,),
          Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8),
            child:Container(
              alignment: Alignment.center,
              width: 64,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.current.dimmedLight,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                controller.foundCourses.value[index].language,textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.current.dimmed,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCourseName(int index){
    return  Text(controller.foundCourses.value[index].nameCourse,
    textAlign: TextAlign.right,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Get.textTheme.bodyLarge?.fontSize,
    ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

}
