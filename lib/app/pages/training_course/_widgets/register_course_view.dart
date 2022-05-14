import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/build_key_value.dart';
import 'package:hayah_karema/app/pages/training_course/training_course_controller.dart';
import 'package:hayah_karema/utils/DateHelper.dart';

class RegisterCoursesView extends GetView<TrainingCourseController> {
  final String programName, programId;

  const RegisterCoursesView({required this.programName, required this.programId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.neutral,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// toolbar
          AppToolbar(title: 'طلب التحاق ببرنامج تدريبي', backCallBack: () => Get.back()),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// program name
                  BuildKeyValue(mKey: 'البرنامج التدريبي:', mValue: programName),

                  Container(
                      width: Get.width,
                      color: AppColors.current.dimmedLight,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: const Text('المواعيد المتاحة')),
                  const SizedBox(height: 5,),
                  Row(children: [
                    Text('اليوم: *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: Get.width/2,
                      child: DropdownButtonFormField<String>(
                        isDense: true,
                        isExpanded: false,
                        hint: const Text('اختر اليوم'),
                        // decoration: dropDownDecoration,
                        items: controller.daysList.map((day) => DropdownMenuItem(child: Text(day), value: day,)).toList(),
                        selectedItemBuilder:(_)=> controller.daysList.map((day) => DropdownMenuItem(child: Text(day), value: day,)).toList(),
                        onChanged: (value) => controller.selectedDay = value,
                        value: controller.selectedDay,
                      ),
                    )
                  ],),
                  const SizedBox(height: 10,),


                 Row(children: [
                   Expanded(
                     child: Row(children: [
                       Text('من: *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
                       const SizedBox(width: 10,),
                       Expanded(child: InkWell(
                         onTap: (){
                           controller.selectTimePicker((TimeOfDay selectedTime){
                             controller.selectedFromAvailableTime = selectedTime;
                             controller.fromAvailableController.text = formatTimeTo12Hrs('${selectedTime.hour}:${selectedTime.minute}:00');
                           });
                         },
                         child: TextFormField(
                           controller: controller.fromAvailableController,
                           enabled: false,
                           decoration: const InputDecoration(hintText: '00:00'),),
                       ))
                     ],),
                   ),
                   const SizedBox(width: 20,),
                   Expanded(
                     child: Row(children: [
                       Text('الي: *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
                       const SizedBox(width: 10,),
                       Expanded(child: InkWell(
                         onTap: (){
                           controller.selectTimePicker((TimeOfDay selectedTime){
                             controller.selectedToAvailableTime = selectedTime;
                             controller.toAvailableController.text = formatTimeTo12Hrs('${selectedTime.hour}:${selectedTime.minute}:00');
                           });
                         },
                         child: TextFormField(
                           controller: controller.toAvailableController,
                           enabled: false,
                           decoration: const InputDecoration(hintText: '00:00'),),
                       ))
                     ],),
                   ),
                 ],),

                  const SizedBox(height: 10,),

                  Container(
                      width: Get.width,
                      color: AppColors.current.dimmedLight,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: const Text('الفترات المطلوبة')),
                  const SizedBox(height: 5,),
                  Row(children: [
                    Expanded(
                      child: Row(children: [
                        Text('من يوم: *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
                        const SizedBox(width: 10,),
                        Expanded(child: InkWell(
                          onTap: (){
                            controller.selectDayPicker((DateTime selectedDay){
                              controller.selectedFromRequiredDay = selectedDay;
                              controller.fromRequiredController.text = '${selectedDay.year}-${selectedDay.month}-${selectedDay.day}';
                            });
                          },
                          child: TextFormField(
                            controller: controller.fromRequiredController,
                            enabled: false,
                            decoration: const InputDecoration(hintText: '--/--/----'),),
                        ))
                      ],),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Row(children: [
                        Text('الي: *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.current.text.withOpacity(0.8)),),
                        const SizedBox(width: 10,),
                        Expanded(child: InkWell(
                          onTap: (){
                            controller.selectDayPicker((DateTime selectedDay){
                              controller.selectedToRequiredDay = selectedDay;
                              controller.toRequiredController.text = '${selectedDay.year}-${selectedDay.month}-${selectedDay.day}';
                            });
                          },
                          child: TextFormField(
                            controller: controller.toRequiredController,
                            enabled: false,
                            decoration: const InputDecoration(hintText: '--/--/----'),),
                        ))
                      ],),
                    ),
                  ],),

                  const SizedBox(height: 10,),

                  Container(
                      width: Get.width,
                      color: AppColors.current.dimmedLight,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: const Text('طريقة الحضور')),

                  Column(
                      children: controller.trainingTypes
                          .map((e) => Row(
                                children: [
                                  Obx(
                                    () => Radio<int?>(
                                      value: e.id,
                                      groupValue: controller.selectTrainingType.value,
                                      onChanged: (int? value) {
                                        controller.onSelectTrainingType(trainingTypeId: value);
                                      },
                                    ),
                                  ),
                                  Text(e.title ?? '')
                                ],
                              ))
                          .toList()),

                  const SizedBox(height: 10,),
                  Text('ملاحظات *', style: TextStyle(fontSize: 13, color: AppColors.current.dimmed),),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: controller.notesController,
                    decoration: const InputDecoration(hintText: 'ملاحظات'),),
                  const SizedBox(height: 16,),
                  _sendRequestButton(),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _sendRequestButton() {
    return SizedBox(
      width: Get.width,
      child: Obx(() {
        return BigBtn(
          state: controller.postApiLoading.value ? BtnState.loading : BtnState.active,
          text: 'إرسال الطلب',
          onPressed: () => controller.onJoinTrainingRequestBtnClick(programId),
        );
      }),
    );
  }
}
