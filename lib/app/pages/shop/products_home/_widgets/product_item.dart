import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String companyName;
  final dynamic price;
  final dynamic rate;
  final String photo;
  final Function? onItemTap;

  const ProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.companyName,
    required this.photo,
    required this.rate,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemTap!(),
      child: Container(
        height: 275.h,
        width: 140.w,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize8, vertical: AppDimens.paddingSize8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.current.accent.withOpacity(.75), width: 1.5.w),
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.current.neutral,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
              child: Image.network(photo, fit: BoxFit.cover, width: 136.w, height: 124.h,
                errorBuilder: (_, __, ___) => Container(width: 136.w, height: 124.h, color: Colors.grey[200],),),
            ),

            Text(
              companyName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: AppDimens.fontSizeSmallXXX,
                color: AppColors.current.text1, //Color(0xFF363535),
              ),
            ),

            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: AppDimens.fontSizeMediumX,
                color: AppColors.current.text1, //Color(0xFF363535),
              ),
            ),

            Text(
              "$price ${AppText.pound}",
              style: TextStyle(
                fontSize: AppDimens.fontSizeMedium,
                color: AppColors.current.text1, //Color(0xFF363535),
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              height: 24.h,
              width: 52.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.current.accent.withOpacity(.1),),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$rate",
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeSmallX,
                      color: AppColors.current.accent,
                    ),
                  ),
                   SizedBox(
                    width: 7.w,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.current.accent,
                    size: 14.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
