import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class DotView extends StatelessWidget {
  const DotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: AppColors.current.text,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
