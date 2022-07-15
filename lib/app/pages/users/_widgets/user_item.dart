import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/models/enums/user_status.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_view.dart';
import 'package:hayah_karema/app/pages/users/_widgets/user_controles_button.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/services/url_launcher/i_url_launcher_service.dart';

class UserItem extends StatelessWidget {
  final PointerItemModel user;
  final Function onChangeStatus;
  final Function onChangePassword;
  const UserItem({Key? key, required this.user, required this.onChangeStatus, required this.onChangePassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  user.avatar ?? '',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                  errorBuilder: (_, __, ___) =>
                      Image.asset(AppAssets.userIcon, fit: BoxFit.cover, height: 60, width: 60),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: Get.textTheme.headline4?.fontSize),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.barcode ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: AppColors.current.text.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: Get.textTheme.headline4?.fontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Obx(() {
                return UserControlsButton(
                    title: user.statusObs.value,
                    color: user.getUserStatus() == UserStatus.PENDING
                        ? AppColors.current.secondary.withOpacity(0.9)
                        : user.getUserStatus() == UserStatus.FREZED
                            ? AppColors.current.text.withOpacity(0.9)
                            : AppColors.current.primary,
                    onClick: () => _onStatusClick());
              }),
              const SizedBox(
                width: 10,
              ),
              UserControlsButton(
                  title: 'اتصال',
                  color: AppColors.current.primary,
                  onClick: () {
                    if (user.mobile != null && user.mobile!.isNotEmpty) {
                      final test = DI.find<IUrlLauncherService>();
                      test.launchTel(user.mobile!);
                    }
                  }),
              const SizedBox(
                width: 10,
              ),
              UserControlsButton(
                  title: 'تغير الباسورد',
                  color: AppColors.current.primary,
                  onClick: () {
                    _displayActionSheet();
                  }),
              const SizedBox(
                width: 10,
              ),
              UserControlsButton(
                  title: 'تفاصيل',
                  color: AppColors.current.accent,
                  onClick: () {
                    Get.toNamed(Routes.PROFILE, arguments: {"user_id": '${user.id}'});
                  }),
            ],
          ),
        ),
      ],
    );
  }

  void _displayActionSheet() {
    Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: AppColors.current.neutral,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]),
        child: NewPasswordView())).then((newPassword) {
          if(newPassword!=null && newPassword.toString().isNotEmpty){
            onChangePassword(user.id, newPassword);
          }
    });
  }

  void _onStatusClick() {
    if (user.getUserStatus() == UserStatus.PENDING) return;

    String newStatus = 'تنشيط'; // used for alert dialog.
    String statusValue = 'معتمد'; // used for api.

    if (user.getUserStatus() == UserStatus.CERTIFIED) {
      newStatus = 'تجميد';
      statusValue = 'مجمد';
    }

    Get.dialog(AlertDialog(
      backgroundColor: AppColors.current.neutral,
      content: Text('هل تريد 00 حساب 11'.replaceAll('11', user.nickname ?? '').replaceAll('00', newStatus)),
      actions: [
        TextButton(onPressed: () {
          Get.back();
          onChangeStatus(user.id, statusValue);
        }, child: Text(AppText.yes)),
        TextButton(onPressed: () => Get.back(), child: Text(AppText.no)),
      ],
    ));
  }
}
