import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  final controller = Get.put(ForgotPasswordController());

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

              _buildToolbar(),

              Empty(height: 20,),

              /// mobile no
              _buildMobileNo(),

              Empty(height: 20,),

              _buildRememberPassword(),

              Empty(height: 20,),

              /// send code.
              _buildSendCode()
            ],
          ),
        ),
      ),
    );
  }

  BigBtn _buildSendCode() {
    return BigBtn(
            state: controller.loginLoading.value? BtnState.loading: BtnState.active,
            text: AppText.sendCode,
            onPressed: () => _onSendCode(),
          );
  }

  TextButton _buildRememberPassword() {
    return TextButton(
            child: Text(AppText.areYouRememberPassword),
            onPressed: ()=> controller.navigateToLoginPage(),
          );
  }

  TextFormField _buildMobileNo() {
    return TextFormField(
            decoration: InputDecoration(hintText: AppText.mobileNumber),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
      onChanged: (val)=> controller.mobileNo=val,
            validator: RequiredValidator(errorText: AppText.requiredField),
            onEditingComplete: ()=> _onSendCode(),
          );
  }

  Row _buildToolbar() {
    return Row(
            children: [
              /// back button
              IconButton(onPressed:()=> controller.navigateToLoginPage(), icon: Icon(Icons.arrow_back_ios, color: AppColors.current.accent, size: 20,)),

              /// title
              Text(
                AppText.pleaseEnterMobileNo,
                style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
              ),
            ],
          );
  }

  _onSendCode(){
    _keyForm.currentState?.save();
    if(_keyForm.currentState!.validate()){
      controller.onSendCodeClick();
    }
  }
}
