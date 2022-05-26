import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/common/widgets/app_toolbar.dart';
import 'package:hayah_karema/app/common/widgets/big_btn.dart';

import 'add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>  controller.backToUsersList(),
      child: Scaffold(
        backgroundColor: AppColors.current.neutral,
        body: SafeArea(
          child: Column(
            children: [
              AppToolbar(
                title: AppText.addUser,
                backCallBack: () => controller.backToUsersList(),
              ),
              _space,
              _buildLoadingIndicator(),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              _buildFullNameTextField(),
              _space,
              _buildNickNameTextField(),
              _space,
              _buildIDNumberTextField(),
              // _space,
              // _buildEmailTextField(),
              _space,
              _buildFirstMobileNo(),
              _space,
              _buildSecondMobileNo(),
              // _space,
              // _buildAddressTextField(),

              Obx(() => controller.isGovernorateRequired.value ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildGovernorateDropDownList(),
              ) : _spaceWidth),

              Obx(() => controller.isCenterRequired.value ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildCenterDropDownList(),
              ) : _spaceWidth),

              Obx(() => controller.isVillageRequired.value ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildVillageDropDownList(),
              ) : _spaceWidth),

              _space,
              _buildHealthStatusDropDownList(),
              _space,
              _buildEducationalStatusDropDownList(),
              _space,
              _buildGenderDropDownList(),
              _space,
              _buildPickFrontIdImage(),
              _space,
              _buildPickBackIdImage(),
              _space,
              _space,
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSecondMobileNo() {
    return Row(
      children: [
        _buildMobileTextField2(),
        _spaceWidth,
        Obx(() {
          return Checkbox(
            value: controller.isSecondMobileNumberHasWhatsApp.value,
            onChanged: (value) {
              controller.isSecondMobileNumberHasWhatsApp.value = value!;
            },
          );
        }),
        const Text('واتس آب'),
      ],
    );
  }

  Row _buildFirstMobileNo() {
    return Row(
      children: [
        _buildMobileTextField1(),
        _spaceWidth,
        Obx(() {
          return Checkbox(
            value: controller.isFirstMobileNumberHasWhatsApp.value,
            onChanged: (value) {
              controller.isFirstMobileNumberHasWhatsApp.value = value!;
            },
          );
        }),
        const Text('واتس آب'),
      ],
    );
  }

  Widget _buildPickFrontIdImage() {
    return SizedBox(
      width: Get.width,
      child: IconButton(
          onPressed: () => controller.pickIdImageFront(),
          icon: Row(
            children: [
              const Icon(Icons.image_sharp),
              _spaceWidth,
              const Text('صورة البطاقة الامامية'),
              _spaceWidth,
              Obx(() => controller.isIdFrontImageCaptured.value
                  ? Icon(Icons.done, color: AppColors.current.primary)
                  : _spaceWidth),
            ],
          )),
    );
  }

  Widget _buildPickBackIdImage() {
    return SizedBox(
      width: Get.width,
      child: IconButton(
          onPressed: () => controller.pickIdImageBack(),
          icon: Row(
            children: [
              const Icon(Icons.image_sharp),
              _spaceWidth,
              const Text('صورة البطاقة الخلفية'),
              _spaceWidth,
              Obx(() => controller.isIdBackImageCaptured.value
                  ? Icon(Icons.done, color: AppColors.current.primary)
                  : _spaceWidth),
            ],
          )),
    );
  }

  get _space => const SizedBox(
        height: 8,
      );

  get _spaceWidth => const SizedBox(
        width: 8,
      );

  Obx _buildGenderDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.gender),
        // decoration: dropDownDecoration,
        items: controller.genderList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.genderList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedGender = value,
        value: controller.selectedGender,
      );
    });
  }

  Obx _buildHealthStatusDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.healthStatus),
        // decoration: dropDownDecoration,
        items: controller.healthList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.healthList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedHealth = value,
        value: controller.selectedHealth,
      );
    });
  }

  Obx _buildEducationalStatusDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.educationalStatus),
        // decoration: dropDownDecoration,
        items: controller.educationList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.educationList
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedEducation = value,
        value: controller.selectedEducation,
      );
    });
  }

  Obx _buildGovernorateDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.governorate),
        // decoration: dropDownDecoration,
        items: controller.governorates
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.governorates
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedGovernorate = value,
        value: controller.selectedGovernorate,
      );
    });
  }

  Obx _buildCenterDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.center),
        // decoration: dropDownDecoration,
        items: controller.centers
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.centers
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedCenter = value,
        value: controller.selectedCenter,
      );
    });
  }

  Obx _buildVillageDropDownList() {
    return Obx(() {
      return DropdownButtonFormField<LookupModel>(
        isDense: true,
        isExpanded: false,
        hint: Text(AppText.village),
        // decoration: dropDownDecoration,
        items: controller.villages
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        selectedItemBuilder: (_) => controller.villages
            .map((value) => DropdownMenuItem(
                  child: Text(value.name ?? ''),
                  value: value,
                ))
            .toList(),
        onChanged: (value) => controller.selectedVillage = value,
        value: controller.selectedVillage,
      );
    });
  }

  Widget _buildFullNameTextField() {
    return Obx(() {
      return TextFormField(
        controller: controller.fullNameTextEditingController,
        enabled: !controller.registerLoading.value,
        decoration: InputDecoration(hintText: AppText.fullName),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (val) => controller.setNickName(val),
        validator: RequiredValidator(errorText: AppText.requiredField),
      );
    });
  }

  Widget _buildIDNumberTextField() {
    return Obx(() {
      return TextFormField(
        controller: controller.iDTextEditingController,
        enabled: !controller.registerLoading.value,
        decoration: InputDecoration(hintText: AppText.idNumber),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        validator: MultiValidator([
          RequiredValidator(errorText: AppText.requiredField),
          LengthRangeValidator(min: 14, max: 14, errorText: AppText.nationalIdValidationMsg)
        ]),
      );
    });
  }

  Widget _buildNickNameTextField() {
    return  TextFormField(
        controller: controller.nickNameTextEditingController,
        enabled: false,
        decoration: InputDecoration(hintText: AppText.nickName),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: RequiredValidator(errorText: AppText.requiredField),
      );
  }

  // Widget _buildEmailTextField() {
  //   return Obx(() {
  //     return TextFormField(
  //       controller: controller.emailTextEditingController,
  //       enabled: !controller.registerLoading.value,
  //       decoration: InputDecoration(hintText: AppText.email),
  //       keyboardType: TextInputType.emailAddress,
  //       textInputAction: TextInputAction.next,
  //       validator: MultiValidator([
  //         RequiredValidator(errorText: AppText.requiredField),
  //         EmailValidator(errorText: AppText.emailValidationMsg)
  //       ]),
  //     );
  //   });
  // }

  // Widget _buildAddressTextField() {
  //   return Obx(() {
  //     return TextFormField(
  //       controller: controller.addressTextEditingController,
  //       enabled: !controller.registerLoading.value,
  //       decoration: InputDecoration(hintText: AppText.address),
  //       keyboardType: TextInputType.text,
  //       textInputAction: TextInputAction.done,
  //     );
  //   });
  // }

  Widget _buildMobileTextField1() {
    return Expanded(
      child: Obx(() {
        return TextFormField(
          controller: controller.mobileNumber1TextEditingController,
          enabled: !controller.registerLoading.value,
          decoration: InputDecoration(hintText: '${AppText.mobileNumber} 1'),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          validator: MultiValidator([
            RequiredValidator(errorText: AppText.requiredField),
            LengthRangeValidator(min: 11, max: 14, errorText: AppText.mobileLengthValidationMsg)
          ]),
        );
      }),
    );
  }

  Widget _buildMobileTextField2() {
    return Expanded(
      child: Obx(() {
        return TextFormField(
          controller: controller.mobileNumber2TextEditingController,
          enabled: !controller.registerLoading.value,
          decoration: InputDecoration(hintText: '${AppText.mobileNumber} 2'),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        );
      }),
    );
  }



  Widget _buildSubmitButton() {
    return Obx(() {
      return BigBtn(
        state: controller.registerLoading.value ? BtnState.loading : BtnState.active,
        text: AppText.register,
        onPressed: () => controller.onRegisterBtnClick(),
      );
    });
  }

  _buildLoadingIndicator() {
    return Obx(() => controller.apiLoading.value ? const CircularProgressIndicator() : _spaceWidth);
  }
}
