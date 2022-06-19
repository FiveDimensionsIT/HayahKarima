import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/common/widgets/profile_image.dart';

class ChangeAccountsView extends StatelessWidget {
  final List<GenericModel> accounts;
  final Function onAccountItemSelectionChange, onChangeAccountBtnClick;

  const ChangeAccountsView({Key? key,
    required this.accounts,
    required this.onAccountItemSelectionChange,
    required this.onChangeAccountBtnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingSize16, horizontal: AppDimens.paddingSize16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// action sheet indicator
            SizedBox(width: Get.width, child: const Center(child: ActionSheetIndicator())),

            const SizedBox(
              height: AppDimens.paddingSize10,
            ),
            Text(
              AppText.changeAccount,
              style: TextStyle(
                  color: AppColors.current.accent, fontSize: AppDimens.fontSizeLargeX, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppDimens.paddingSize10,
            ),

            Expanded(
              child: ListView.separated(
                itemBuilder: (cxt, index) =>
                    ChangeAccountItem(
                      account: accounts[index],
                      onAccountClick: () => onAccountItemSelectionChange(account: accounts[index]),
                    ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppDimens.paddingSize16.h),
                itemCount: accounts.length,
              ),
            ),

            BigBtn(text: AppText.change, onPressed: () => onChangeAccountBtnClick())
          ],
        ),
      ),
    );
  }
}

class ChangeAccountItem extends StatelessWidget {
  final GenericModel account;
  final Function onAccountClick;

  const ChangeAccountItem({Key? key, required this.account, required this.onAccountClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onAccountClick(),
      child: Obx(() {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16, vertical: AppDimens.paddingSize10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
              border:
              Border.all(
                  color: account.isSelectedObs?.value == true ? AppColors.current.primary : AppColors.current.dimmedX)),
          child: Row(
            children: [
              ProfileImage(
                width: 44.w,
                profileImageUrl: account.imgPath ?? '',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSize16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.title ?? '',
                        style: TextStyle(fontSize: AppDimens.fontSizeMediumXX, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: AppDimens.paddingSize8,
                      ),
                      Text(
                        account.subTitle ?? '',
                        style: TextStyle(fontSize: AppDimens.fontSizeMedium),
                      )
                    ],
                  ),
                ),
              ),
              if (account.isSelectedObs?.value == true) SvgPicture.asset(AppAssets.doneGreenIcon)
            ],
          ),
        );
      }),
    );
  }
}
