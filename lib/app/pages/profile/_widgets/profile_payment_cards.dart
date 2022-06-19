import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/payment_card_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/remove_confirmation_view.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/save_confirmation_view.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';

class ProfilePaymentCards extends GetView<ProfileController> {
  const ProfilePaymentCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.paymentCards.isEmpty) return const EmptyResponse();
      return Column(
        children: [
          Column(
              children:
                  controller.paymentCards.map((payment) => ProfilePaymentCardItem(paymentCardModel: payment)).toList()),


          Padding(
            padding: const EdgeInsets.only(top: AppDimens.paddingSize16, bottom: AppDimens.paddingSize8),
            child: BigBtn(text: AppText.addNewCard, onPressed: (){}),
          ),
        ],
      );
    });
  }
}

class ProfilePaymentCardItem extends StatelessWidget {
  final PaymentCardModel paymentCardModel;

  ProfilePaymentCardItem({required this.paymentCardModel, Key? key}) : super(key: key);

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: AppDimens.paddingSize12),
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
                  onChanged: (val)=> _displaySaveConfirmation()),
            ),
            Text(
              paymentCardModel.cardTitle,
              style: TextStyle(color: AppColors.current.text, fontSize: AppDimens.fontSizeMediumX),
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
                onPressed: () => _displayRemoveConfirmation(),
              ),
            )
          ],
        ),
      );
    });
  }

  void _displayRemoveConfirmation() {
    String name = AppText.deleteFromTitle;
    name = name.replaceAll('{0}', AppText.cards);
    Get.bottomSheet(
      Container(
          decoration: BoxDecoration(
              color: AppColors.current.neutral,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
          child: RemoveConfirmationView(
            title: AppText.removePaymentCardConfirmation,
            onDelete: () => controller.onDeletePaymentCard(card: paymentCardModel), name: name,
          )),
      isScrollControlled: true,
    );
  }

  void _displaySaveConfirmation() {
    Get.bottomSheet(
      Container(
          decoration: BoxDecoration(
              color: AppColors.current.neutral,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
          child: SaveConfirmationView(
            title: AppText.savePaymentTitle,
            onSaveClick: () => _onPaymentCardSelected(),
          )),
      isScrollControlled: true,
    );
  }

  void _onPaymentCardSelected() {
    final selectedIndex = controller.paymentCards.indexWhere((address) => address.isSelected.value == true, -1);
    if (selectedIndex > -1) controller.paymentCards[selectedIndex].isSelected.value = false;
    paymentCardModel.isSelected.value = true;
  }
}
