import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularStatistic extends StatelessWidget {
  final Color activeColor;
  final double initValue;
  final Widget content;
  final double cardBorderRadius;

  const CircularStatistic({Key? key, required this.activeColor,
    this.initValue = 0,
    this.cardBorderRadius = 20,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCircularStatistic();
  }

  Widget _buildCircularStatistic() {
    return Center(
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: initValue,
        onChange: null,
        onChangeEnd: null,
        innerWidget: (val)=> _buildContentDesign,
        appearance: CircularSliderAppearance(
          startAngle: 180,
          angleRange: 180,
          size: Get.width * 0.8,
          customWidths: CustomSliderWidths(handlerSize: 0, progressBarWidth: 35, trackWidth: 35),
          animationEnabled: true,
          customColors: CustomSliderColors(
            progressBarColor: activeColor,
            trackColor: activeColor.withOpacity(0.1),
            hideShadow: true
          ),

        ),
      ),
    );
  }

  get _buildContentDesign => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: AppColors.current.transparent,
    ),
    child: content,
  );
}
