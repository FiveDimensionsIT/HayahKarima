import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';
import 'package:hayah_karema/app/pages/auth/change_password/change_password_view.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildInformationTab();
  }

  /// Build TabBars views
  Widget _buildInformationTab() {
    return Column(
        children: [
          _buildName(),
          const SizedBox(height: 10,),
          _buildNationalId(),
          const SizedBox(height: 10,),
          _buildTitle(),
          const SizedBox(height: 10,),
          _buildEmail(),
          const SizedBox(height: 10,),
          _buildPhone(),
          const SizedBox(height: 10,),
          _buildAddress(),
          const SizedBox(height: 16,),
          _buildChangePassword(),
          const SizedBox(height: 5,),
        ],
    );
  }

  // Build TextFormed field in Tab Information
  Widget _buildName() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.fullName),
      enabled: false,
    );
  }
  Widget _buildNationalId() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.nationalId),
      enabled: false,
    );
  }
  Widget _buildTitle() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.title),
      enabled: false,
    );
  }
  Widget _buildEmail() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.email),
      enabled: false,
    );
  }
  Widget _buildPhone() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.mobileNumber),
      enabled: false,
    );
  }
  Widget _buildAddress() {
    return TextField(
      decoration: InputDecoration(hintText: AppText.location),
      enabled: false,
    );
  }
  Widget _buildChangePassword() {
    return BigBtn(
      text: AppText.changePassword,
      onPressed: () => _displayActionSheet(),
    );
  }

  void _displayActionSheet(){
    Get.bottomSheet(ChangePasswordView());
  }

}
