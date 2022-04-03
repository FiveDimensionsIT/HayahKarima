import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class DetailsStatisticCourseView  extends StatelessWidget {
  final TrainingCourseModel? item;
  const DetailsStatisticCourseView ({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildNumberOfHoursCourse(),
        Empty(width: 4,),
        _buildNumberOfSectionCourse(),
        Empty(width: 4,),
        // _buildRateCourse(),
        // Empty(width: 4,),
        _buildNameCourse(),
      ],
    );
  }

  Widget _buildNumberOfHoursCourse(){
    return Container(
      width: 94,
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
          Text('${item?.no_of_hours} ساعة ',style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.current.primary
          ),)
        ],
      ),
    );
  }
  Widget _buildNumberOfSectionCourse(){
    return Container(
      width: 94,
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
          Text('${item?.lecture_duration_in_minutes} مقطع ',style: TextStyle(
              fontSize: Get.textTheme.bodySmall?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.primary
          ),)
        ],
      ),
    );
  }

  Widget _buildRateCourse(){
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


          Text('4.5',style: TextStyle(
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

  Widget _buildNameCourse(){
    return  Container(
      alignment: Alignment.center,
      width: 64,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.current.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        item?.category??'',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Get.textTheme.bodySmall?.fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.current.primary,
        ),
      ),
    );
  }
}
