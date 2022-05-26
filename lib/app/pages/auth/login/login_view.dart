import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  LoginView({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

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
        key: controller.keyForm,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// action sheet indicator
              SizedBox(width: Get.width, child: const Center(child: ActionSheetIndicator())),

              Empty(
                height: 15,
              ),

              /// title
              _buildToolbar(),

              Empty(
                height: 20,
              ),

              Text(
                AppText.enterCode,
                style: TextStyle(fontSize: Get.textTheme.bodySmall?.fontSize, color: AppColors.current.dimmed),
              ),
              Empty(
                height: 5,
              ),
              _buildCodeNoTextField(),
              Empty(
                height: 5,
              ),

              _buildRequiredCode(),

              Empty(
                height: 10,
              ),

              Text(
                AppText.enterPassword,
                style: TextStyle(fontSize: Get.textTheme.bodySmall?.fontSize, color: AppColors.current.dimmed),
              ),
              Empty(
                height: 5,
              ),
              _buildPasswordTextField(),

              /// forgot password

              Empty(
                height: 10,
              ),

              SizedBox(width: Get.width, child: Center(child: _buildForgotPassword())),

              Empty(
                height: 15,
              ),

              /// login
              _buildLoginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequiredCode() =>
      Obx(() =>
      controller.isUserCodeRequired.value == true
          ? Text(AppText.requiredField,
          style: TextStyle(fontSize: Get.textTheme.bodySmall?.fontSize, color: AppColors.current.error))
          : const SizedBox());

  SizedBox _buildToolbar() {
    return SizedBox(
      width: Get.width,
      child: Text(
        AppText.loginTitle,
        style: TextStyle(
            fontSize: Get.textTheme.headline3?.fontSize, color: AppColors.current.accent, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCodeNoTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Obx(() {
          return _buildUserCodeTextFiledItem(
              focusNode: controller.lastFocusNode,
              textEditingController: controller.lastTextEditingController,
              enabled: controller.loginLoading,
              borderColor: controller.isUserCodeRequired.value ? AppColors.current.error : AppColors.current
                  .dimmedLight,
              onTextChanged: (val) =>
                  controller.appendUserCode(val, controller.passwordFocusNode, controller.middleFocusNode));
        }),

        const SizedBox(width: 10,),

        Obx(() {
          return _buildUserCodeTextFiledItem(
              focusNode: controller.middleFocusNode,
              textEditingController: controller.middleTextEditingController,
              enabled: controller.loginLoading,
              borderColor: controller.isUserCodeRequired.value ? AppColors.current.error : AppColors.current
                  .dimmedLight,
              onTextChanged: (val) =>
                  controller.appendUserCode(val, controller.lastFocusNode, controller.firstFocusNode));
        }),

        const SizedBox(width: 10,),

        Obx(() {
          return _buildUserCodeTextFiledItem(
              focusNode: controller.firstFocusNode,
              textEditingController: controller.firstTextEditingController,
              borderColor: controller.isUserCodeRequired.value ? AppColors.current.error : AppColors.current
                  .dimmedLight,
              enabled: controller.loginLoading,
              onTextChanged: (val) => controller.appendUserCode(val, controller.middleFocusNode, null));
        })
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Obx(() {
      return TextFormField(
        focusNode: controller.passwordFocusNode,
        enabled: !controller.loginLoading.value,
        decoration: InputDecoration(
          hintText: AppText.enterPassword,
        ),
        obscureText: true,
        textInputAction: TextInputAction.done,
        onChanged: (val) => controller.password.value = val,
        validator: RequiredValidator(errorText: AppText.requiredField),
        onEditingComplete: () => _onLogin(),
      );
    });
  }

  TextButton _buildForgotPassword() {
    return TextButton(
      child: Text(AppText.forgotPassword),
      onPressed: () => controller.navigateToForgotPassword(),
    );
  }

  Widget _buildUserCodeTextFiledItem({required FocusNode focusNode,
    required TextEditingController textEditingController,
    required RxBool enabled,
    required Color borderColor,
    required Function onTextChanged}) {
    return Obx(() {
      return SizedBox(
        width: Get.width / 4,
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          enabled: !enabled.value,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '---',
            counter: const SizedBox(),
            border: _outlineInputBorder(borderColor),
            enabledBorder: _outlineInputBorder(borderColor),
          ),
          maxLength: 3,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          onChanged: (val) => onTextChanged(val),
        ),
      );
    });
  }

  Widget _buildLoginButton() {
    return Obx(() {
      return BigBtn(
        state: controller.loginLoading.value ? BtnState.loading : BtnState.active,
        text: AppText.login,
        onPressed: () => _onLogin(),
      );
    });
  }

  _onLogin() {
    controller.onLoginClick();
  }

  OutlineInputBorder _outlineInputBorder(color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: color, width: 1,));
  }
}
