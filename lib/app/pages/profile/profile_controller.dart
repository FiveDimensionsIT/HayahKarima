import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/address_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/payment_card_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/profile_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_earn_point_model.dart';
import 'package:hayah_karema/app/common/managers/api/profile/_model/user_rewards.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/themes/app_assets.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class ProfileController extends GetxController {
  final _apiManager = DI.find<IHomeApiManager>();
  final _profileApiManager = DI.find<IProfileAPIManager>();
  final _action = ActionCenter();

  String? name, nationalId, title, email, phone, address;
  var loginLoading = false.obs;
  final pointsApiLoading = false.obs;
  final pointsEarnedApiLoading = false.obs;
  final profileApiLoading = false.obs;
  final userRewardsApiLoading = false.obs;
  final userAddressesApiLoading = false.obs;
  final userPaymentCardsApiLoading = false.obs;
  var currentTabIndex = 0.obs;

  final Rx<UserPointsResponse> userPointsResponse = UserPointsResponse().obs;
  final Rx<ProfileModel> profileModel = ProfileModel().obs;
  final RxList<UserEarnedPointModel> userEarnedPointModelList = <UserEarnedPointModel>[].obs;
  final RxList<UserRewards> userRewardsModelList = <UserRewards>[].obs;
  final RxList<AddressModel> addresses = <AddressModel>[].obs;
  final RxList<PaymentCardModel> paymentCards = <PaymentCardModel>[].obs;

  final String _userId = '3'; //Get.arguments['user_id']

  @override
  void onInit() {
    super.onInit();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _getProfileData();
    _getUserPointsAPI();
    _getUserEarnedPointsAPI();
    _getUserRewardsAPI();
    _getUserAddressesAPI();
    _getUserPaymentCardsAPI();
  }

  void _getUserPointsAPI() async {
    pointsApiLoading.value = true;
    UserPointsResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getUserPoints(userId: _userId);
    }, checkConnection: true);
    //
    pointsApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        userPointsResponse.value = result!;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getUserEarnedPointsAPI() async {
    pointsEarnedApiLoading.value = true;
    List<UserEarnedPointModel>? result;

    var success = await _action.execute(() async {
      result = await _profileApiManager.getUserEarnedPoints(userId: _userId);
    }, checkConnection: true);
    //
    pointsEarnedApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        if (userEarnedPointModelList.isNotEmpty) userEarnedPointModelList.clear();
        userEarnedPointModelList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getProfileData() async {
    profileApiLoading.value = true;
    ProfileModel? result;
    var success = await _action.execute(() async {
      result = await _profileApiManager.getProfileData(_userId);
    }, checkConnection: true);
    //
    profileApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        profileModel.value = result!;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  //
  void _getUserRewardsAPI() async {
    userRewardsApiLoading.value = true;
    List<UserRewards>? result;
    var success = await _action.execute(() async {
      result = await _profileApiManager.getUserRewards(userId: _userId);
    }, checkConnection: true);
    userRewardsApiLoading.value = false;
    if (success) {
      if (result != null) {
        if (userRewardsModelList.isNotEmpty) userRewardsModelList.clear();
        userRewardsModelList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getUserAddressesAPI() {
    addresses.assignAll([
      AddressModel(
          addressId: '0', addressTitle: 'Address Title Name0', userName: 'Ahmed Dawoud0', addressDesc: 'Address desc'),
      AddressModel(
          addressId: '1', addressTitle: 'Address Title Name1', userName: 'Ahmed Dawoud1', addressDesc: 'Address desc'),
      AddressModel(
          addressId: '2', addressTitle: 'Address Title Name2', userName: 'Ahmed Dawoud2', addressDesc: 'Address desc'),
      AddressModel(
          addressId: '3', addressTitle: 'Address Title Name3', userName: 'Ahmed Dawoud3', addressDesc: 'Address desc'),
      AddressModel(
          addressId: '4', addressTitle: 'Address Title Name4', userName: 'Ahmed Dawoud4', addressDesc: 'Address desc'),
      AddressModel(
          addressId: '5', addressTitle: 'Address Title Name5', userName: 'Ahmed Dawoud5', addressDesc: 'Address desc'),
    ]);
  }

  void _getUserPaymentCardsAPI() {
    paymentCards.assignAll([
      PaymentCardModel(
          cardId: 'cardId0',
          cardName: 'cardName0',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentAman,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId1',
          cardName: 'cardName1',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentMiza,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId2',
          cardName: 'cardName2',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentMasterCard,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId3',
          cardName: 'cardName3',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentFawry,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId4',
          cardName: 'cardName4',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentYalla,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId5',
          cardName: 'cardName4',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentVodafon,
          expDate: '05/25'),
      PaymentCardModel(
          cardId: 'cardId6',
          cardName: 'cardName4',
          cardNumber: '1234-4321-1234-4321',
          cardImgPath: AppAssets.paymentVisa,
          expDate: '05/25'),
    ]);
  }

  void onDeleteAddress({required AddressModel address}) {
    addresses.removeWhere((a) => a.addressId == address.addressId);
    addresses.refresh();
  }

  void onDeletePaymentCard({required PaymentCardModel card}) {
    paymentCards.removeWhere((c) => c.cardId == card.cardId);
    paymentCards.refresh();
  }
}
