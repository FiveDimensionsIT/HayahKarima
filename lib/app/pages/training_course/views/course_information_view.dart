import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/details_course/views/details_course_view.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/app/pages/training_course/views/statistic_course_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class TrainingCourseItemView extends GetView<TrainingCourseController> {
  final TrainingCourseModel item;
  const TrainingCourseItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> DetailsCourseView(item: item,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.current.neutral,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: AppColors.current.primary, width: 1.0,)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageCourse(),
                Empty(height: 8,),
                _buildTrainee(),
                Empty(height: 5,),
                _buildCourseName(),
                Empty(height: 10,),
                StatisticCourseView(item: item),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCourse(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(item.image??'',
        width: Get.width,
        height: Get.height/5,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget  _buildTrainee(){
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.current.transparent,
            radius: 18,
            backgroundImage: AssetImage(item.imageTrainer??''),
          ),
           Empty(width: 16,),
           Expanded(
             child: Text(item.trainerName??'',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Get.textTheme.headline3?.fontSize,
                color: AppColors.current.text,
              ),
          ),
           ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.current.dimmedLight,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(item.language??'',textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.dimmed,
            ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCourseName(){
    return  Text(item.nameCourse??'',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Get.textTheme.bodyLarge?.fontSize,
    ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

}
