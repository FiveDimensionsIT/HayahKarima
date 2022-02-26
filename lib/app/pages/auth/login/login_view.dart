import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/themes/app_theme.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/action_sheet_indicator.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/utils/ui/empty.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {

  final controller = Get.put(LoginController());

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

              /// title
              _buildToolbar(),

              Empty(height: 20,),

              /// mobile no
              _buildMobileNoTextField(),

              Empty(height: 10,),

              /// password
              _buildPasswordTextField(),

              /// forgot password

              Empty(height: 10,),

              _buildForgotPassword(),

              Empty(height: 20,),

              /// login
              _buildLoginButton()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildToolbar() {
    return SizedBox(
            width: Get.width,
            child: Text(
              AppText.loginTitle,
              style: TextStyle(fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
            ),
          );
  }

  TextFormField _buildMobileNoTextField() {
    return TextFormField(
            decoration: InputDecoration(hintText: AppText.mobileNumber),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            onSaved: (val)=> controller.mobileNo,
            validator: RequiredValidator(errorText: AppText.requiredField),
          );
  }

  TextFormField _buildPasswordTextField() {
    return TextFormField(
            decoration: InputDecoration(hintText: AppText.password,),
            obscureText: true,
            textInputAction: TextInputAction.done,
            onSaved: (val) => controller.password,
            validator: RequiredValidator(errorText: AppText.requiredField),
            onEditingComplete: ()=> _onLogin(),
          );
  }

  TextButton _buildForgotPassword() {
    return TextButton(
            child: Text(AppText.forgotPassword),
            onPressed: () => controller.navigateToForgotPassword(),
          );
  }

  BigBtn _buildLoginButton() {
    return BigBtn(
            state: controller.loginLoading.value? BtnState.loading: BtnState.active,
            text: AppText.login,
            onPressed: () => _onLogin(),
          );
  }

  _onLogin(){
    _keyForm.currentState?.save();
    if(_keyForm.currentState!.validate()){
      controller.onLoginClick();
    }
  }

}
