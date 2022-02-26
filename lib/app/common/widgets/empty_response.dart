import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class EmptyResponse extends StatelessWidget {

  const EmptyResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Icon(Icons.cloud_off_outlined, size: 70, color: AppColors.current.dimmed,),
        ),
        Text(AppText.noData),
      ],);
  }
}
