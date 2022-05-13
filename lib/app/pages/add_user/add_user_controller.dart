import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/auth/_model/user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/add_user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/register_user_response.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'package:image_picker/image_picker.dart';

class AddUserController extends GetxController {

  // final addressTextEditingController = TextEditingController();
  // final emailTextEditingController = TextEditingController();

  final mobileNumber2TextEditingController = TextEditingController();
  final mobileNumber1TextEditingController = TextEditingController();

  final iDTextEditingController = TextEditingController();
  final fullNameTextEditingController = TextEditingController();
  final nickNameTextEditingController = TextEditingController();

  final _action = ActionCenter();
  final _cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IUserApiManager>();

  RxBool registerLoading = false.obs;

  RxBool isGovernorateRequired = false.obs;
  RxBool isCenterRequired = false.obs;
  RxBool isVillageRequired = false.obs;

  RxBool isFirstMobileNumberHasWhatsApp = false.obs;
  RxBool isSecondMobileNumberHasWhatsApp = false.obs;
  RxBool apiLoading = false.obs;

  RxList<LookupModel> genderList = <LookupModel>[].obs;
  LookupModel? selectedGender;

  RxList<LookupModel> educationList = <LookupModel>[].obs;
  LookupModel? selectedEducation;

  RxList<LookupModel> healthList = <LookupModel>[].obs;
  LookupModel? selectedHealth;

  RxList<LookupModel> governorates = <LookupModel>[].obs;
  LookupModel? selectedGovernorate;

  RxList<LookupModel> centers = <LookupModel>[].obs;
  LookupModel? selectedCenter;

  RxList<LookupModel> villages = <LookupModel>[].obs;
  LookupModel? selectedVillage;

  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  XFile? idFrontImageFile, idBackImageFile;
  RxBool isIdFrontImageCaptured = false.obs;
  RxBool isIdBackImageCaptured = false.obs;
  UserData? userData;

  @override
  void onInit() {
    super.onInit();
    _initComponentVisibility();
    _getGenderLookup();
    _getEducationsLookup();
    _getHealthLookup();
  }

  @override
  void onClose() {
    // emailTextEditingController.dispose();
    // addressTextEditingController.dispose();
    mobileNumber2TextEditingController.dispose();
    mobileNumber1TextEditingController.dispose();
    iDTextEditingController.dispose();
    fullNameTextEditingController.dispose();
    nickNameTextEditingController.dispose();
    super.onClose();
  }

  void _resetData() {
    // addressTextEditingController.clear();
    // emailTextEditingController.clear();

    mobileNumber2TextEditingController.clear();
    mobileNumber1TextEditingController.clear();
    iDTextEditingController.clear();
    fullNameTextEditingController.clear();
    nickNameTextEditingController.clear();

    selectedGender = null;
    selectedEducation = null;
    selectedHealth = null;

    selectedGovernorate = null;
    selectedCenter = null;
    selectedVillage = null;

    idFrontImageFile = null;
    idBackImageFile = null;

    isIdFrontImageCaptured.value = false;
    isIdBackImageCaptured.value = false;
    isFirstMobileNumberHasWhatsApp.value = false;
    isSecondMobileNumberHasWhatsApp.value = false;
  }

  void setNickName(String fullName) {
    if (fullName.contains(' ')) {
      List<String> splitFullNameArray = fullName.split(' ');
      nickNameTextEditingController.text = '${splitFullNameArray[0]} ${splitFullNameArray[splitFullNameArray.length - 1]}';
    }
  }

  void pickIdImageFront() async {
    idFrontImageFile = await _picker.pickImage(source: ImageSource.camera);
    isIdFrontImageCaptured.value = true;
  }

  void pickIdImageBack() async {
    idBackImageFile = await _picker.pickImage(source: ImageSource.camera);
    isIdBackImageCaptured.value = true;
  }

  void onRegisterBtnClick() {
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {

      if(mobileNumber2TextEditingController.text.isNotEmpty && (mobileNumber2TextEditingController.text.length<11 || mobileNumber2TextEditingController.text.length>14)){
        OverlayHelper.showErrorToast('الهاتف المحمول٢ غير صحيح');
        return;
      }

      if(selectedGender == null || selectedGender!.id == null){
        OverlayHelper.showErrorToast('اختر الجنس');
        return;
      }

      if(selectedHealth == null || selectedHealth!.id == null){
        OverlayHelper.showErrorToast('اختر الحالة الذهنية');
        return;
      }

      if(selectedEducation == null || selectedEducation!.id == null){
        OverlayHelper.showErrorToast('اختر الحالة التعليمية');
        return;
      }

      if(isGovernorateRequired.value && (selectedGovernorate == null || selectedGovernorate!.id == null)){
        OverlayHelper.showErrorToast('اختر المحافظة');
        return;
      }

      if(isCenterRequired.value && (selectedCenter == null || selectedCenter!.id == null)){
        OverlayHelper.showErrorToast('اختر المركز');
        return;
      }

      if(isVillageRequired.value && (selectedVillage == null || selectedVillage!.id == null)){
        OverlayHelper.showErrorToast('اختر القرية');
        return;
      }

      if(isIdFrontImageCaptured.value == false){
        OverlayHelper.showErrorToast('التقط صورة الرقم القومي الامامية');
        return;
      }

      if(isIdBackImageCaptured.value == false){
        OverlayHelper.showErrorToast('التقط صورة الرقم القومي الخلفية');
        return;
      }

      _registerUserApi();
    }
  }

  // region === API ===
  void _registerUserApi() async {
    registerLoading.value = true;

    List<Phones> phones = [Phones(number: mobileNumber1TextEditingController.text, whatsapp: isFirstMobileNumberHasWhatsApp.value)];
    if (mobileNumber2TextEditingController.text.isNotEmpty) {
      phones.add(Phones(number: mobileNumber2TextEditingController.text, whatsapp: isSecondMobileNumberHasWhatsApp.value));
    }

    final bytes1 = await idFrontImageFile!.readAsBytes();
    final bytes2 = await idBackImageFile!.readAsBytes();


    AddUserData addUserData = AddUserData(
      fullName: fullNameTextEditingController.text,
      nickname: nickNameTextEditingController.text,
      identificationNumber: iDTextEditingController.text,
      genderId: selectedGender?.id,
      healthStatusId: selectedHealth?.id,
      educationalStatusId: selectedEducation?.id,

      citizenGovernorateId: selectedGovernorate == null ? null : selectedGovernorate!.id,
      citizenCenterId: selectedCenter == null ? null : selectedCenter!.id,
      citizenVillageId: selectedVillage == null ? null : selectedVillage!.id,

      idImageFront: IdImageFront(base64: base64Encode(bytes1), filename: idFrontImageFile?.name),
      idImageBack: IdImageBack(base64: base64Encode(bytes2), filename: idBackImageFile?.name),
      phones: phones,
      createdBy: userData?.id,
      creatorGroupId: userData?.group,
    );
    RegisterUserResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.registerUser(addUserData);
    }, checkConnection: true);
    //
    registerLoading.value = false;
    //
    if (success) {
      if (result != null) {
        Get.snackbar(result?.message??'', '', messageText: Row(
          children:  [
            const Text('كود المستخدم:'),
            const SizedBox(width: 10,),
            Text(result?.code??''),
          ],
        ));
        _resetData();
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }else {
      OverlayHelper.showErrorToast(AppText.somethingWrong);
    }
  }

  void _getGenderLookup() async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.genderLookup();
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        genderList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getEducationsLookup() async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.educationStatusLookup();
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        educationList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getHealthLookup() async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.healthStatusLookup();
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        healthList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getGovernoratesLookup() async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.governoratesLookup();
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        governorates.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getVillagesLookup(String id) async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.villagesLookup(id);
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        villages.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getCentersLookup(String id) async {
    apiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.centersLookup(id);
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        centers.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _initComponentVisibility() async {
    await _cacheManager.init();
    userData = _cacheManager.getUserData();
    if (userData?.governorateRequired?.toLowerCase() == 'true' || userData?.governorateRequired?.toLowerCase() == '1') {
      isGovernorateRequired.value = true;
      _getGovernoratesLookup();
    }
    if (userData?.centerRequired?.toLowerCase() == 'true' || userData?.centerRequired?.toLowerCase() == '1') {
      isCenterRequired.value = true;
      _getCentersLookup(userData!.governorateId!);
    }
    if (userData?.villageRequired?.toLowerCase() == 'true' || userData?.villageRequired?.toLowerCase() == '1') {
      isVillageRequired.value = true;
      _getVillagesLookup(userData!.centerId!);
    }
  }

// endregion
}
