
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

class AnswerAndScoreView extends StatelessWidget {
   AnswerAndScoreView({Key? key}) : super(key: key);
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
          Empty(height: 16,),
          _buildQuestion(),
          Empty(height: 16,),
          _buildRadio(),
          Empty(height: 16,),
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
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.current.primary),
        ),
        const Spacer(flex: 1,),
        Container(
          width: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.current.primary.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            '10 نقاط',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.current.primary),
          ),
        )
      ],
    );
  }
  Widget _buildQuestion() {
    return Text('موسم 1962-1963، الترسانة فازت بـ الدوري، لكن الزمالك تفوق في المواجهات المباشرة بينهم، اتقابلوا أربع مرات، حمادة إمام سجل في الأربع ماتشات، والزمالك كسب منها تلاتة، والرابعة انتهت تعادل؟',
    style: TextStyle(
      fontSize: Get.textTheme.bodyMedium?.fontSize,
    ),
    );
  }
  Widget _buildRadio(){
    return Column(
      children: [
        Obx((){
          return Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.current.dimmed.withOpacity(0.2),
                    width: 1
                )
            ),
            child: Row(
              children: [
                Radio(
                  value: 'one',
                  groupValue:controller.answer.value,
                  onChanged: (value){
                    controller.onChangeAnswer(value);
                  },
                  activeColor: AppColors.current.primary,
                ),
                Text('واحد واحد',
                style: TextStyle(
                  fontSize: Get.textTheme.bodyMedium?.fontSize,
                ),
                )
              ],
            ),
          );
        }),
        Empty(height: 8),
        Obx((){
          return Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.current.dimmed.withOpacity(0.2),
                    width: 1
                )
            ),
            child: Row(
              children: [
                Radio(
                  value: 'two',
                  groupValue:controller.answer.value,
                  onChanged: (value){
                    controller.onChangeAnswer(value);
                  },
                  activeColor: AppColors.current.primary,
                ),
                Text('اتنين اتنين',
                  style: TextStyle(
                    fontSize: Get.textTheme.bodyMedium?.fontSize,
                  ),
                )
              ],
            ),
          );
        }),
        Empty(height: 8),
        Obx((){
          return Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.current.dimmed.withOpacity(0.2),
                    width: 1
                )
            ),
            child: Row(
              children: [
                Radio(
                  value: 'three',
                  groupValue:controller.answer.value,
                  onChanged: (value){
                    controller.onChangeAnswer(value);
                  },
                  activeColor: AppColors.current.primary,
                ),
                Text('ثلاته ثلاته',
                  style: TextStyle(
                    fontSize: Get.textTheme.bodyMedium?.fontSize,
                  ),
                )
              ],
            ),
          );
        }),
        Empty(height: 8),
        Obx((){
          return Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.current.dimmed.withOpacity(0.2),
                    width: 1
                )
            ),
            child: Row(
              children: [
                Radio(
                  value: 'four',
                  groupValue:controller.answer.value,
                  onChanged: (value){
                    controller.onChangeAnswer(value);
                  },
                  activeColor: AppColors.current.primary,
                ),
                Text('أربعة أربعة',
                  style: TextStyle(
                    fontSize: Get.textTheme.bodyMedium?.fontSize,
                  ),
                )
              ],
            ),
          );
        }
        ),
        Empty(height: 8),
        Obx((){
          return Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.current.dimmed.withOpacity(0.2),
                    width: 1
                )
            ),
            child: Row(
              children: [
                Radio(
                  value: 'five',
                  groupValue:controller.answer.value,
                  onChanged: (value){
                    controller.onChangeAnswer(value);
                  },

                  activeColor: AppColors.current.primary,
                ),
                Text('خمسة خمسة',
                  style: TextStyle(
                    fontSize: Get.textTheme.bodyMedium?.fontSize,
                  ),
                ),
              ],
            ),
          );
        }),

      ],
    );
  }
  Widget _buildSendAnswer(){
    return Row(
      children: [
        InkWell(
            onTap: (){},
            child: SvgPicture.asset('assets/icons/sound.svg',height: 48,width: 48,)
        ),
        Empty(width: 16,),
        InkWell(
            onTap: (){},
            child: SvgPicture.asset('assets/icons/replace.svg',height: 48,width: 48,)
        ),
        Empty(width: 16,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              textStyle: const TextStyle(fontSize: 16,fontWeight:FontWeight.bold,height: 1,),
            ),
            onPressed: (){},
            child: Text(AppText.sendAnswer))
      ],
    );
  }
}
