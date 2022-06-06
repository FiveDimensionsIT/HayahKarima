import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class ShippingAddressItem extends StatelessWidget {
  const ShippingAddressItem({Key? key, required this.address, required this.addressDescription}) : super(key: key);
final String address;
final String addressDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimens.pagePadding,
      margin: AppDimens.horizontalPadding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.current.text1.withOpacity(.75)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText.name,
          style: TextStyle(
            fontSize: AppDimens.fontSizeMediumXX,
            fontWeight: FontWeight.bold,
            color: AppColors.current.text1,
          ),
          ),
          SizedBox(height: 8.h,),
          Text(address,
            style: TextStyle(
              fontSize: AppDimens.fontSizeMediumXX,
              fontWeight: FontWeight.bold,
              color: AppColors.current.text1,
            ),
          ),
          SizedBox(height: 8.h,),
          Text(addressDescription,
            style: TextStyle(
              fontSize: AppDimens.fontSizeMediumX,
              color: AppColors.current.text1,
            ),
          ),
          SizedBox(height: 8.h,),

      ],),
    );
  }
}
