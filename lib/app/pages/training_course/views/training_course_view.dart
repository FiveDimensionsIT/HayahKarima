import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/app/pages/training_course/views/course_information_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class TrainingCourseView extends GetView<TrainingCourseController> {
   const TrainingCourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body:SafeArea(
        child: Column(
          children: [
            AppToolbar(title:AppText.courses,
                drawerCallBack: (){},
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child:SingleChildScrollView(
      child: Padding(
        padding: AppTheme.pagePadding,
        child: Column(
          children: [
            _buildSearchCourse(),
            Empty(height: 16,),
            const CourseInformationView(),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildSearchCourse(){
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color:AppColors.current.accent.withOpacity(0.2), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),
          ),
          prefixIcon: SizedBox(
            width: 56,
            child: Image.asset('assets/icons/search.png',
              width: 20,height: 20,
            ),
          ),
          hintText: AppText.searchCourse,
         hintStyle: const TextStyle(
          fontSize: 22,
      ),
      ),
      onChanged: (value){
        controller.filterCourse(value);
      },
    );
  }

}
