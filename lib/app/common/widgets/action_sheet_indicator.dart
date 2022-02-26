import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class ActionSheetIndicator extends StatelessWidget {
  const ActionSheetIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 60,
      decoration: BoxDecoration(color: AppColors.current.dimmed.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
    );;
  }
}
