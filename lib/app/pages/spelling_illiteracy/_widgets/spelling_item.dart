import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/pages/spelling_illiteracy/spelling_illiteracy_controller.dart';

class SpellingItem extends StatelessWidget {
  final ContentModel item;

  const SpellingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        item.name,
        maxLines: 3,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.current.text,
            fontWeight: FontWeight.w600,
            fontSize: AppDimens.fontSizeVeryLarge,
            wordSpacing: 1),
      ),
    );
  }
}
