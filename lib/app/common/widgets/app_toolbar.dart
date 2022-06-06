import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';

class AppToolbar extends StatelessWidget {
  final String title;
  final Function? backCallBack;
  final Function? drawerCallBack;
  final Widget? actions;

  const AppToolbar({Key? key, required this.title, this.backCallBack, this.drawerCallBack, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppDimens.paddingSize10, top: AppDimens.paddingSize8),
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: AppColors.current.dimmed.withOpacity(0.15), blurRadius: 3, offset: const Offset(0, 6))
          ]),
      child: Row(
        children: [
          /// back button
          if (backCallBack != null)
            IconButton(
                onPressed: () => backCallBack!(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.current.accent,
                  size: 20,
                ))
          else if (drawerCallBack != null)
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                onPressed: () => drawerCallBack!(),
                icon: Icon(
                  Icons.menu,
                  color: AppColors.current.accent,
                  size: 25,
                ))
          else
            const SizedBox(
              width: 16,
            ),

          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AppDimens.fontSizeLargeX,
                  color: AppColors.current.accent,
                  fontWeight: FontWeight.bold),
            ),
          ),

          actions??const SizedBox()
        ],
      ),
    );
  }
}
