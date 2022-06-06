import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({Key? key,required this.price,required this.additionalCosts,required this.totalPrice}) : super(key: key);
final dynamic price;
  final dynamic additionalCosts;
  final dynamic totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      margin: AppDimens.pagePadding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.current.accent),
        color: const Color(0xFFFEF1E8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(AppText.price,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeMediumXX,
                  color: AppColors.current.text1,
                ),
              ),
              const Spacer(),
              Text("$price ${AppText.pound}",
                style: TextStyle(
                  color: AppColors.current.text1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
              Text(AppText.additionalCosts,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeMediumXX,
                  color: AppColors.current.text1,
                ),
              ),
              const Spacer(),
              Text("$additionalCosts ${AppText.pound}",
                style: TextStyle(
                  color: AppColors.current.text1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
              Text(AppText.totalPrice,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeLargeX,
                  color: AppColors.current.accent,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(),
              Text("$totalPrice ${AppText.pound}",
                style: TextStyle(
                    fontSize: AppDimens.fontSizeLargeX,
                    color: AppColors.current.accent,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],),
    );
  }
}
