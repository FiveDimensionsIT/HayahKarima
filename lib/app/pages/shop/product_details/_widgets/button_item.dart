import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';


class ButtonItem extends StatelessWidget {
  final String title;
  final  Function? onButtonTap;
  const ButtonItem(
      {Key? key,
        required this.title,
         this.onButtonTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTap!(),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        margin:const  EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.current.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title,
        style: TextStyle(
          color: AppColors.current.neutral,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    ) ;
  }
}
