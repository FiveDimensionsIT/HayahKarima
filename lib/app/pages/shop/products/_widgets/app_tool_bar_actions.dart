import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';

class AppToolBarActions extends StatelessWidget {
 final Function? onBasketTap;
 final  Function? onFilterTap;

 const AppToolBarActions({Key? key, this.onBasketTap, this.onFilterTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          onPressed: () => onBasketTap!(),
          icon: SvgPicture.asset(AppAssets.basket, color: AppColors.current.primary,width: 25,),
        ),
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          onPressed: () => onFilterTap!(),
          icon: SvgPicture.asset(AppAssets.filter, color: AppColors.current.primary,width: 20,),
        ),
        const SizedBox(width: 9,),
      ],
    );
  }
}
