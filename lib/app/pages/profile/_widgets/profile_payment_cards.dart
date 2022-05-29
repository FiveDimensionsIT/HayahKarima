import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/payment_card_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';

class ProfilePaymentCards extends GetView<ProfileController> {
  const ProfilePaymentCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {

          return controller.paymentCards.isEmpty
              ? const EmptyResponse()
              : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (cxt, index) => ProfilePaymentCardItem(paymentCardModel: controller.paymentCards[index]),
              separatorBuilder: (_, __) => const SizedBox(height: AppDimens.paddingSize12,),
              itemCount: controller.paymentCards.length);
        }));
  }
}

class ProfilePaymentCardItem extends GetView<ProfileController> {
  final PaymentCardModel paymentCardModel;

  const ProfilePaymentCardItem({required this.paymentCardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.paddingSize16),
          border: Border.all(
              width: 1,
              color: paymentCardModel.isSelected.value == true ? AppColors.current.primary : AppColors.current.dimmed),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40.w,
              height: 35.h,
              child: Radio<PaymentCardModel>(
                  activeColor: AppColors.current.primary,
                  value: paymentCardModel,
                  groupValue: paymentCardModel.isSelected.value == true ? paymentCardModel : null,
                  onChanged: _onPaymentCardSelected),
            ),
            Text(
              paymentCardModel.cardTitle,
              style: TextStyle(
                  color: AppColors.current.text,
                  fontSize: AppDimens.fontSizeMediumX),
            ),
            const Spacer(),

            paymentCardModel.isSvgAsset()
                ? SvgPicture.asset(paymentCardModel.cardImgPath)
                : Image.asset(paymentCardModel.cardImgPath),

            SizedBox(
              width: 45.w,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: AppColors.current.error,
                ),
                onPressed: () => controller.onDeletePaymentCard(card: paymentCardModel),
              ),
            )
          ],
        ),
      );
    });
  }

  void _onPaymentCardSelected(card) {
    final selectedIndex = controller.paymentCards.indexWhere((address) => address.isSelected.value == true, -1);
    if (selectedIndex > -1) controller.paymentCards[selectedIndex].isSelected.value = false;
    card!.isSelected.value = true;
  }
}
