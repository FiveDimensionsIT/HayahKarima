import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/martyrs_prayers_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/my_village_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/home/home_controller.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/NumberHelper.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

class GridDetailsController extends GetxController {
  var galleryApiLoading = false.obs;
  var buttonApiLoading = false.obs;
  var apiLoading = false.obs;
  final _apiManager = DI.find<IHomeApiManager>();
  final _cacheManager = DI.find<ICacheManager>();
  final _action = ActionCenter();
  final galleryList = <GalleryModel>[].obs;

  var contactsEnum = Get.arguments["ContactsEnum"];
  var pointerItemModel = Get.arguments["PointerItemModel"];

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad() async{
    await _cacheManager.init();

    if (contactsEnum != ContactsEnum.myVillage) {
      getGalleryApi(pointerItemModel.id!);
    } else {
      getMyVillageAPI();
    }
  }

  /// region === api
  void getGalleryApi(int contactId) async {
    galleryApiLoading.value = true;
    if (galleryList.isNotEmpty) galleryList.clear();

    List<GalleryModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getContactsGallery(contactId);
    }, checkConnection: true);
    //
    galleryApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        galleryList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    } else {
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }

  void getMyVillageAPI() async {
    apiLoading.value = true;

    final userData = _cacheManager.getUserData();
    final myVillageId = userData?.villageId;

    MyVillageModel? villageModel;

    var success = await _action.execute(() async {
      villageModel = await _apiManager.getMyVillage(myVillageId);
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (villageModel != null) {
        pointerItemModel = PointerItemModel(
            id: villageModel!.id,
            avatar: "https://roayahnews.com/wp-content/uploads/2021/07/%D9%85%D8%A8%D8%A7%D8%AF%D8%B1%D8%A9-%D8%AD%D9%8A%D8%A7%D8%A9-%D9%83%D8%B1%D9%8A%D9%85%D8%A9.jpg",
            village: villageModel!.governorate,
            fullName: villageModel!.name,
            name: villageModel!.name,
            center: villageModel!.center,
            villagePeople: formatter.format(villageModel!.population),
            villagePoints: formatter.format(villageModel!.indicator),
            biography:villageModel!.description,);

        if (galleryList.isNotEmpty) galleryList.clear();
        galleryList.assignAll(villageModel!.images??[]);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    } else {
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }

  void prayingForMartyrs() async{
    buttonApiLoading.value = true;

    final userData = _cacheManager.getUserData();

    MartyrsPrayersRequest request = MartyrsPrayersRequest(points: '10', martyrId: '${pointerItemModel.id}', userId: userData!.id, date: DateTime.now().toIso8601String(), );
    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.postPrayingForMartyrs(request);
    }, checkConnection: true);
    //
    buttonApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        OverlayHelper.showSuccessToast(result["message"]??'');
        if(result["message"]!=null && result["message"].toString().isNotEmpty && result["message"].toString().contains('مبروك')){
          Get.find<HomeController>().onRefreshUserPoints();
        }
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    } else {
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }

  /// endregion === api

}

