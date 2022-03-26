import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';
import 'package:video_player/video_player.dart';

class TimelineQuestionItemView extends StatelessWidget {
  final List<QuestionResponse> questions;

  TimelineQuestionItemView({Key? key, required this.questions}) : super(key: key);
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.pagePadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.current.primary,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          _buildPoints(),
          Empty(
            height: 16,
          ),
          _buildQuestion(),
          Empty(
            height: 16,
          ),
          _buildAnswers(),
          Empty(
            height: 16,
          ),
          _buildSendAnswer()
        ],
      ),
    );
  }

  Widget _buildPoints() {
    return Row(
      children: [
        Text(
          AppText.answerAndScore,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.current.primary),
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.current.primary.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            '10 نقاط',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.current.primary),
          ),
        )
      ],
    );
  }

  Widget _buildQuestion() {
    return Text(
      questions[0].question_text ?? '',
      style: TextStyle(
        fontSize: Get.textTheme.bodyMedium?.fontSize,
      ),
    );
  }

  Widget _buildAnswers() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (cxt, index) => _buildAnswerItem(index),
      separatorBuilder: (BuildContext context, int index) =>
      const SizedBox(
        height: 5,
      ),
    );
  }

  Container _buildAnswerItem(int index) {
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

  Widget _buildSendAnswer() {
    return Row(
      children: [
        InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/sound.svg', height: 45, width: 45,)),

        Empty(width: 10,),

        InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/replace.svg', height: 45, width: 45,)),

        Empty(width: 20,),

        Expanded(
          child: Obx(() {
            return BigBtn(
                state: controller.sendAnswerLoading.value ? BtnState.loading : BtnState.active,
                text: AppText.sendAnswer,
                onPressed: () => controller.sendAnswerBtnClick());
          }),
        ),
      ],
    );
  }
}
