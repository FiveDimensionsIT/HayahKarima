import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/build_key_value.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/DateHelper.dart';

import '../../../common/managers/api/courses/_models/available_course_model.dart';

class AvailableCourseItem extends GetView<TrainingCourseController> {
  final AvailableCourseModel courseModel;
  const AvailableCourseItem({Key? key,required  this.courseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// course name
        BuildKeyValue(mKey: 'البرنامج التدريبي:', mValue: courseModel.program),

        /// course barcode
        BuildKeyValue(mKey: 'الكود:', mValue:courseModel.barcode),

        Row(children: [
          Expanded(child: BuildKeyValue(mKey: 'من:', mValue:formatDateToDay(courseModel.dateFrom ?? ''))),
          Expanded(child: BuildKeyValue(mKey: 'الي:', mValue:formatDateToDay(courseModel.dateTo ?? ''))),
        ],),

        BuildKeyValue(mKey: 'عدد الساعات في اليوم:', mValue:'${courseModel.noOfHoursPerDay} ساعة/ساعات '),

        BuildKeyValue(mKey: 'المكان:', mValue:courseModel.trainingPlace),


        Container(
            width: Get.width,
            color: AppColors.current.dimmedLight,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: const Text('اختر الميعاد المناسب لك')),

        if (courseModel.dates != null && courseModel.dates!.isNotEmpty)
          Column(
            children: courseModel.dates!
                .map((date) => Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 30,
                      child: Obx(()=> Radio<String>(
                        value: date!.dateId,
                        groupValue: controller.selectCourseDate.value,
                        onChanged: (String? value){
                          controller.onSelectCourseDate(dateId: value);
                        },
                      ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(flex: 2,child: _buildKeyValueCheckBox('يوم:', date?.day )),
                              Expanded(flex: 1,child: _buildKeyValueCheckBox('من:', date?.timeFrom )),

                            ],
                          ),
                          Row(
                            children: [
                              Expanded(flex: 2,child: _buildKeyValueCheckBox('الموافق:', formatDateToDay(date?.date??'') )),
                              Expanded(flex: 1,child: _buildKeyValueCheckBox('الي:', date?.timeTo )),
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),

                const Divider(height: 10,),
              ],
            ))
                .toList(),
          ),

        _joinNowButton(courseModel.id!),
      ],
    );
  }


  Widget _buildKeyValueCheckBox(String key, String? value){
    return value==null || value.isEmpty ? const SizedBox(): Row(
      children: [
        Text(key, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
        const SizedBox(width: 5,),
        Text(value, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),),
      ],);
  }

  Widget _joinNowButton(int courseId) {
    return SizedBox(
      width: Get.width,
      child: Obx(() {
        return BigBtn(
          state: controller.postApiLoading.value ? BtnState.loading : BtnState.active,
          text: 'حجز هذا الميعاد',
          onPressed: () => controller.joinToAvailableCourse(courseId: courseId),
        );
      }),
    );
  }
}
