import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class OrderContentsItem extends StatelessWidget {
  const OrderContentsItem({
    Key? key,
    required this.photo,
    this.price,
    required this.title,
    required this.quantity,
  }) : super(key: key);
  final String photo;
  final dynamic price;
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      margin: AppDimens.horizontalPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.current.text1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.generalBorderRadius),
            child: Image.network(
              photo,
              fit: BoxFit.cover,
              width: 64.w,
              height: 64.h,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], width: 64.w, height: 64.h),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.current.text1,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "$quantity ${AppText.quantity}",
                        style: TextStyle(
                          color: AppColors.current.text1,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Text(
                      "$price ${AppText.pound}",
                      style: TextStyle(
                        color: AppColors.current.text1,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
