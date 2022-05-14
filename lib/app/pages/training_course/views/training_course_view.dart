import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/app/pages/training_course/views/course_information_view.dart';
import 'package:hayah_karema/utils/ui/empty.dart';


class TrainingCourseView extends StatelessWidget  {
   TrainingCourseView({Key? key}) : super(key: key);

  var controller = Get.find<TrainingCourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
        child: Column(
          children: [
            AppToolbar(title: AppText.courses, backCallBack: () => Get.back(),),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppTheme.pagePadding,
          child: Column(
            children: [
              _buildSearchCourse(),
              Empty(height: 10,),
              _buildTrainingCourseList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchCourse() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.current.accent.withOpacity(0.2), width: 1),),
        prefixIcon: Padding(padding: const EdgeInsets.all(16), child: Image.asset(AppAssets.searchIcon, width: 20, height: 20,),),
        hintText: AppText.searchCourse,
        hintStyle: TextStyle(fontSize: Get.textTheme.headline2?.fontSize,),
      ),
      onChanged: (value) => controller.filterCourse(value),
    );
  }

  Widget _buildTrainingCourseList() {
    return Obx(() {
      if(controller.apiLoading.value) return const Center(child: CircularProgressIndicator(),);

      if(controller.coursesList.isEmpty) return const Center(child: EmptyResponse());

      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (cxt, index) => TrainingCourseItemView(item: controller.coursesList[index]),
          separatorBuilder: (_, __) => const SizedBox(height: 0,),
          itemCount: controller.coursesList.length);
    });
  }
}
