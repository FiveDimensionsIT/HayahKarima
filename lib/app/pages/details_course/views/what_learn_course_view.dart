import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/coursce/_model/course_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class WhatLearnCourseView extends StatelessWidget {
   WhatLearnCourseView({Key? key,this.item}) : super(key: key);
   final CourseModel? item;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppText.whatLearn,
          style: TextStyle(
              fontSize: Get.textTheme.headline3?.fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.current.primary
          ),
        ),
        Empty(height: 8,),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: item?.goals?.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  padding: AppTheme.pagePadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 1,
                      color: AppColors.current.primary.withOpacity(0.1),
                    ),
                  ),
                  // error
                  child: Text('item.goals[index].goal',
                    style: TextStyle(
                      fontSize: Get.textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
