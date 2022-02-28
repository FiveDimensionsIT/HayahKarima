import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class HomeController extends GetxController {

  final provincesList = [].obs;
  final centersList = [].obs;
  final villagesList = [].obs;
  final citizensList = [].obs;
  final categoriesList = [].obs;
  var statisticNumber = 0.obs;

  var provincesLoading = false.obs;
  var centersLoading = false.obs;
  var villagesLoading = false.obs;
  var citizensLoading = false.obs;
  var categoriesLoading = false.obs;

  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  _onLoad() {
    getStatisticNumber();
    getProvincesApi();
    getCentersApi();
    getVillagesApi();
    getCitizenApi();
    getCategoriesApi();
  }

  void getStatisticNumber() async {
    final request = DigitalPointerRequest(statusId: 2, pageNo: 1);
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getStatisticNumber(request);
    }, checkConnection: true);
    //
    if (success) {
      if (result != null) {
        statisticNumber.value = result?.first.villagesCount??0;
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
  void getProvincesApi() async {
    provincesLoading.value = true;
    final request = DigitalPointerRequest(countryId: 1, statusId: 2, pageNo: 1, orderBy: 'indicator desc');
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getProvincesPointer(request);
    }, checkConnection: true);
    //
    provincesLoading.value = false;
    //
    if (success) {
      if (result != null) {
        provincesList.assignAll(result??[]);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
  //
  void getCentersApi() async {
    centersLoading.value = true;
    final request = DigitalPointerRequest(countryId: 1, statusId: 2, pageNo: 1, orderBy: 'indicator desc');
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getCentersPointer(request);
    }, checkConnection: true);
    //
    centersLoading.value = false;
    //
    if (success) {
      if (result != null) {
        centersList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
  //
  void getVillagesApi() async {
    villagesLoading.value = true;
    final request = DigitalPointerRequest(countryId: 1, statusId: 2, pageNo: 1, orderBy: 'indicator desc');
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getVillagesPointer(request);
    }, checkConnection: true);
    //
    villagesLoading.value = false;
    //
    if (success) {
      if (result != null) {
        villagesList.assignAll(result?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void getCitizenApi() async {
    citizensLoading.value = true;
    final request = DigitalPointerRequest(roleId: 2, statusId: 2, pageNo: 1, orderBy: 'indicator desc');
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getCitizensPointer(request);
    }, checkConnection: true);
    //
    citizensLoading.value = false;
    //
    if (success) {
      if (result != null) {
        citizensList.assignAll(result?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void getCategoriesApi() async {
    categoriesLoading.value = true;
    List<PointerItemModel>? result;
    final request = DigitalPointerRequest(pageNo: 1, orderBy: 'indicator desc');
    var success = await _action.execute(() async {
      result = await _apiManager.getCategoriesPointer(request);
    }, checkConnection: true);
    //
    categoriesLoading.value = false;
    //
    if (success) {
      if (result != null) {
        categoriesList.assignAll(result??[]);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }
}
