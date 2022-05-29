import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/address_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/widgets/empty_response.dart';
import 'package:hayah_karema/app/pages/profile/profile_controller.dart';

class ProfileAddresses extends GetView<ProfileController> {
  const ProfileAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Obx(() {

          return controller.addresses.isEmpty
              ? const EmptyResponse()
              : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (cxt, index) => ProfileAddressItem(addressModel: controller.addresses[index]),
              separatorBuilder: (_, __) => const SizedBox(height: AppDimens.paddingSize12,),
              itemCount: controller.addresses.length);
        }));
  }
}

class ProfileAddressItem extends GetView<ProfileController> {
  final AddressModel addressModel;

  const ProfileAddressItem({Key? key, required this.addressModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
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
                      onChanged: _onAddressSelected),
                ),
                Text(
                  addressModel.userName,
                  style: TextStyle(
                      color:
                      addressModel.isSelected.value == true ? AppColors.current.primary : AppColors.current.text,
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
                    onPressed: () => controller.onDeleteAddress(address: addressModel),
                  ),
                )
              ],
            ),

            // address title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16),
              child: Text(
                addressModel.addressTitle,
                style:  TextStyle(fontSize: AppDimens.fontSizeMedium, fontWeight: FontWeight.bold),
              ),
            ),

            // address desc.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16, vertical: AppDimens.paddingSize8),
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

  void _onAddressSelected(address) {
    final selectedIndex = controller.addresses.indexWhere((address) => address.isSelected.value == true, -1);
    if (selectedIndex > -1) controller.addresses[selectedIndex].isSelected.value = false;
    address!.isSelected.value = true;
  }
}
