import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import 'change_password_controller.dart';

class ChangePasswordView extends StatelessWidget {
  final controller = Get.put(ChangePasswordController());
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyView(),
    );
  }

  Widget _buildBodyView() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.current.neutral,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          boxShadow: [BoxShadow(color: AppColors.current.dimmed.withOpacity(0.3), blurRadius: 10)]
      ),
      child: Padding(
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

                _buildOldPasswordTextField(),

                Empty(height: 10,),
                /// new password
                _buildNewPasswordTextField(),

                Empty(height: 10,),

                /// confirm new password
                _buildConfirmNewPasswordTextField(),

                Empty(height: 20,),

                /// confirm
                _buildConfirmPasswordButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildToolbar() {
    return Row(
      children: [
        /// back button
        IconButton(onPressed:()=> Get.back(), icon: Icon(Icons.arrow_back_ios, color: AppColors.current.accent, size: 20,)),

        Text(
          AppText.changePassword,
          style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  TextFormField _buildOldPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: AppText.oldPassword,),
      obscureText: true,
      textInputAction: TextInputAction.next,
      onChanged: (val) => controller.oldPassword=val,
      validator: RequiredValidator(errorText: AppText.requiredField),
    );
  }

  TextFormField _buildNewPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: AppText.newPassword,),
      obscureText: true,
      textInputAction: TextInputAction.next,
      onChanged: (val) => controller.newPassword=val,
      validator: RequiredValidator(errorText: AppText.requiredField),
    );
  }

  TextFormField _buildConfirmNewPasswordTextField() {
    return TextFormField(

      decoration: InputDecoration(hintText: AppText.confirmNewPassword,),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (val) => controller.confirmNewPassword=val,
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
