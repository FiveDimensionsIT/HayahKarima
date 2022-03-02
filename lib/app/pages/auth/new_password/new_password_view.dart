import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import 'new_password_controller.dart';

class NewPasswordView extends  StatelessWidget {

  final controller = Get.put(NewPasswordController());
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

              /// new password
              _buildNewPasswordTextField(),

              Empty(height: 10,),

              /// confirm new password
              _buildConfirmNewPasswordTextField(),

              Empty(height: 30,),

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
        IconButton(onPressed:()=> controller.navigateForgotPassword(), icon: Icon(Icons.arrow_back_ios, color: AppColors.current.accent, size: 20,)),

        Text(
          AppText.enterNewPassword,
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  TextFormField _buildNewPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: AppText.newPassword,),
      obscureText: true,
      textInputAction: TextInputAction.next,
      onSaved: (val) => controller.newPassword,
      validator: RequiredValidator(errorText: AppText.requiredField),
    );
  }

  TextFormField _buildConfirmNewPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: AppText.confirmNewPassword,),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onSaved: (val) => controller.confirmNewPassword,
      validator: RequiredValidator(errorText: AppText.requiredField),
      onEditingComplete: ()=> _onConfirm(),
    );
  }

  _buildConfirmPasswordButton(){
    return BigBtn(
      state: controller.loginLoading.value? BtnState.loading: BtnState.active,
      text: AppText.confirm,
      onPressed: () => _onConfirm(),
    );
  }

  _onConfirm(){
    _keyForm.currentState?.save();
    if(_keyForm.currentState!.validate()){
      controller.onConfirmClick();
    }
  }
}
