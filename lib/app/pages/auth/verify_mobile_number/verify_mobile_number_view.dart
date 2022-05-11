import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/utils/ui/empty.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'verify_mobile_number_controller.dart';

class VerifyMobileNoView extends StatelessWidget {

  final controller = Get.put(VerifyMobileNoController());
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyView(),
    );
  }

  Widget _buildBodyView() {
    return Padding(
      padding: AppTheme.pagePadding,
      child: Form(
        key: _keyForm,
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// action sheet indicator
              const ActionSheetIndicator(),

              Empty(height: 20,),

              /// toolbar
              _buildToolbar(),

              Empty(height: 20,),

              _buildPhoneNumberBody(),

              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPinCode(),
                  _buildErrorHint(),
                ],),),

              /// confirm
              _buildConfirmPasswordButton()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildToolbar() {
    return Row(
      children: [

        /// back button
        IconButton(onPressed: () => controller.backToForgotPassword(),
            icon: Icon(Icons.arrow_back_ios, color: AppColors.current.accent, size: 20,)),

        Text(
          AppText.authMobNoTitle,
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize,
              color: AppColors.current.accent,
              fontWeight: FontWeight.bold),
        ),

        const Expanded(child: SizedBox(),),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(color: AppColors.current.primaryLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Obx(() {
            return Text(controller.timeout.value, style: TextStyle(color: AppColors.current.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold),);
          }),),
      ],
    );
  }

  Widget _buildPhoneNumberBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: Obx(() {
        return RichText(
          text: TextSpan(
              text: AppText.enterCodeSent,
              children: [
                TextSpan(
                    text: "  ${controller.mobileNo.value}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Get.textTheme.bodyText1?.fontSize)),
              ],
              style: TextStyle(
                  color: AppColors.current.dimmed, fontSize: Get.textTheme.bodyText1?.fontSize, height: 2)),
          textAlign: TextAlign.center,
        );
      }),
    );
  }

  Widget _buildPinCode() {
    return Form(
      key: controller.formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PinCodeTextField(
            appContext: Get.context!,
            pastedTextStyle: TextStyle(color: AppColors.current.text, fontWeight: FontWeight.normal,),
            textStyle: TextStyle(color: AppColors.current.text, fontWeight: FontWeight.normal,),
            length: 6,
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: AppColors.current.neutral,
              activeColor: AppColors.current.primary,
              inactiveColor: AppColors.current.dimmedLight,
            ),
            cursorColor: AppColors.current.accent,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: false,
            keyboardType: TextInputType.number,
            boxShadows: const [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.white,
                blurRadius: 2,
              )
            ],
            onCompleted: (v) => controller.hasError.value = false,
            onChanged: (value) => controller.code = value,
            beforeTextPaste: (text) => true,
            // validator: RequiredValidator(errorText: AppText.requiredField),
          )),
    );
  }

  Widget _buildErrorHint() {
    return Obx(() {
      return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          controller.hasError.value ? AppText.requiredField : "",
          style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      );
    });
  }

  _buildConfirmPasswordButton() {
    return BigBtn(
      state: controller.loginLoading.value ? BtnState.loading : BtnState.active,
      text: AppText.confirm,
      onPressed: () => _onConfirm(),
    );
  }

  _onConfirm() {
    _keyForm.currentState?.save();
    if (_keyForm.currentState!.validate()) {
      controller.onConfirmClick();
    }
  }

}
