import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem(
      {Key? key,
      required this.orderStatusTextColor,
      required this.orderNumber,
      required this.orderStatus,
      required this.orderStatusColor,
      required this.date,
      required this.price,
      required this.numberOfElements,
        this.onTap,
      })
      : super(key: key);
  final  Function? onTap;
  final Color orderStatusTextColor;
  final String orderNumber;
  final Color orderStatusColor;
  final String orderStatus;
  final String date;
  final dynamic price;
  final int numberOfElements;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        padding:  AppDimens.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  orderNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimens.fontSizeLargeX,
                    color: AppColors.current.text1,
                  ),
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                      color: orderStatusColor,
                      borderRadius:
                          BorderRadius.circular(AppDimens.generalBorderRadius.r)),
                  child: Text(
                    orderStatus,
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeMedium,
                      color: orderStatusTextColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: AppDimens.fontSizeMediumXX,
                color: AppColors.current.text1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text("$numberOfElements ${AppText.elements}",
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeMediumXX,
                      color: AppColors.current.text1,
                    ),
                  ),
                ),
                Text(
                  "$price ${AppText.pound}",
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeMediumXX,
                    color: AppColors.current.primary, //Color(0xFF363535),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
