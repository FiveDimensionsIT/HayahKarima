import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/address_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/remove_confirmation_view.dart';
import 'package:hayah_karema/app/pages/profile/_widgets/save_confirmation_view.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';

class ProfileAddresses extends GetView<ProfileController>  {

  const ProfileAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.addresses.isEmpty) return const EmptyResponse();
      return Column(
        children: [
          Column(children: controller.addresses.map((address) => ProfileAddressItem(addressModel: address)).toList(),),
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.paddingSize16, bottom: AppDimens.paddingSize8),
            child: BigBtn(text: AppText.addNewCard, onPressed: (){}),
          ),
        ],
      );
    });
  }
}

class ProfileAddressItem extends GetView<ProfileController> {
  final AddressModel addressModel;

  const ProfileAddressItem({Key? key, required this.addressModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: AppDimens.paddingSize12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.paddingSize16),
          border: Border.all(
              width: 1,
              color: addressModel.isSelected.value == true ? AppColors.current.primary : AppColors.current.dimmed),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //radio + address name + edit + delete
            Row(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 35.h,
                  child: Radio<AddressModel>(
                      activeColor: AppColors.current.primary,
                      value: addressModel,
                      groupValue: addressModel.isSelected.value == true ? addressModel : null,
                      onChanged: (val) => _displaySaveConfirmation()),
                ),
                Text(
                  addressModel.userName,
                  style: TextStyle(
                      color: addressModel.isSelected.value == true ? AppColors.current.primary : AppColors.current.text,
                      fontSize: AppDimens.fontSizeMediumX),
                ),
                const Spacer(),
                SizedBox(
                  width: 35.w,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.current.primary,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 35.w,
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

            // address title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16),
              child: Text(
                addressModel.addressTitle,
                style: TextStyle(fontSize: AppDimens.fontSizeMedium, fontWeight: FontWeight.bold),
              ),
            ),

            // address desc.
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16, vertical: AppDimens.paddingSize8),
              child: Text(
                addressModel.addressDesc,
                style: TextStyle(fontSize: AppDimens.fontSizeMedium, color: AppColors.current.dimmed),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _onAddressSelected() {
    final selectedIndex = controller.addresses.indexWhere((address) => address.isSelected.value == true, -1);
    if (selectedIndex > -1) controller.addresses[selectedIndex].isSelected.value = false;
    addressModel.isSelected.value = true;
  }


  void _displayRemoveConfirmation() {
    String name = AppText.deleteFromTitle;
    name = name.replaceAll('{0}', AppText.addresses);
    Get.bottomSheet(
      Container(
          decoration: BoxDecoration(
              color: AppColors.current.neutral,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
          child: RemoveConfirmationView(
            title: AppText.removeAddressConfirmation,
            onDelete: () => controller.onDeleteAddress(address: addressModel), name: name,
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
              title: AppText.saveAddressTitle,
              onSaveClick: () => _onAddressSelected()
          )),
      isScrollControlled: true,
    );
  }
}
