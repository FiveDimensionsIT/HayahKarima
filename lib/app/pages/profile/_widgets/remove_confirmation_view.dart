import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';

class RemoveConfirmationView extends StatelessWidget {
  final String name;
  final String title;
  final Function onDelete;
  const RemoveConfirmationView({Key? key, required this.onDelete, required this.title, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSize16, horizontal: AppDimens.paddingSize16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// action sheet indicator
            SizedBox(width: Get.width, child: const Center(child: ActionSheetIndicator())),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSize16),
              child: Text(
                name,
                style: TextStyle(fontSize: AppDimens.fontSizeLargeX, fontWeight: FontWeight.bold),
              ),
            ),

            Text(
              title,
              style: TextStyle(
                fontSize: AppDimens.fontSizeMediumXX,
              ),
            ),

            const SizedBox(
              height: AppDimens.paddingSize20,
            ),

            BigBtn(
                bgColor: AppColors.current.error,
                text: AppText.delete,
                onPressed: () {
                  onDelete();
                  Get.back();
                }),

            const SizedBox(
              height: AppDimens.paddingSize16,
            ),

            BigBtn(bgColor: AppColors.current.neutral, text: AppText.back, onPressed: () => Get.back())
          ],
        ),
      );
  }
}
