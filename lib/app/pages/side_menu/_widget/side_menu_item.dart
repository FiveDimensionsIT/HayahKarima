import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/pages/side_menu/side_menu_controller.dart';

class SideMenuItem extends StatelessWidget {
  final MenuItemModel itemModel;

  const SideMenuItem({Key? key, required this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      horizontalTitleGap: 0,
      onTap: () {
        if (itemModel.isExpandable == null || itemModel.isExpandable == false) Get.back();
        itemModel.onTap();
      },


      title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: itemModel.iconPath == null
                  ? AppColors.current.dimmed.withOpacity(0.1)
                  : AppColors.current.transparent),
          child: Text(itemModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.textTheme.headline4?.fontSize))),


      leading: itemModel.iconPath == null
          ? const SizedBox()
          : SvgPicture.asset(itemModel.iconPath ?? '', color: AppColors.current.accent,width: 25,),


      trailing: itemModel.isExpandable ?? false ? const Icon(CupertinoIcons.chevron_down) : const SizedBox(),
    );
  }
}
