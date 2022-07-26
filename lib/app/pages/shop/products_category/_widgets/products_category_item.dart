import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class ProductsCategoryItem extends StatelessWidget {
  final String title;
  final String companyName;
  final dynamic price;
  final dynamic rate;
  final String photo;
  final Function? onItemTap;
  final Function? onBuyTap;
  const ProductsCategoryItem({
    Key? key,
    required this.title,
    required this.price,
    required this.companyName,
    required this.photo,
    required this.rate,
    this.onItemTap,
    this.onBuyTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemTap!(),
      child: Container(
        // height: 270,width: 150,
        padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.current.accent.withOpacity(.75), width: 2.w),
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.current.neutral,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 124.h,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 124.h,
                ),
              ),
            ),
             SizedBox(
              height: 8.h,
            ),
            Text(
              companyName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.current.text1, //Color(0xFF363535),
              ),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.current.text1, //Color(0xFF363535),
              ),
            ),
            Text(
              "$price ${AppText.pound}",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.current.text1, //Color(0xFF363535),
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(
              height: 8.h,
            ),
            Container(
              width: 62.w,
              padding:  EdgeInsets.symmetric(vertical: 6.h, horizontal: 9.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.current.accent.withOpacity(.1),
              ),
              child: Row(
                children: [
                  Text(
                    "$rate",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.current.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(
                    width: 7.w,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.current.accent,
                    size: 20.sp,
                  )
                ],
              ),
            ),
             SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () => onBuyTap!(),
              child: Container(
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.current.accent,
                ),
                child: Text(
                  AppText.buy,
                  style: TextStyle(color: AppColors.current.neutral, fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
