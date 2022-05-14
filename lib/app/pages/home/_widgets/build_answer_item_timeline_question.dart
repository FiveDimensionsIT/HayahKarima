import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';

class BuildAnswerItem extends StatelessWidget {
  final int index;
  final List<QuestionResponse> questions;

  BuildAnswerItem({Key? key,
    required this.index,
    required this.questions}) : super(key: key);

  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.current.dimmed.withOpacity(0.2), width: 1)),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 35,
            child: Radio<String>(
              value: questions[index].answer_option_text ?? '',
              groupValue: controller.selectedAnswer,
              onChanged: (value) {
                controller.onChangeAnswer(value);
              },
              activeColor: AppColors.current.primary,
            ),
          ),
          Expanded(
            child: Text(
              questions[index].answer_option_text ?? '',
              style: TextStyle(
                fontSize: Get.textTheme.bodyMedium?.fontSize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
