import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class HomelandMartyrsController extends GetxController {
  var apiLoading = false.obs;
  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();
  List<PointerItemModel> martyrsList = <PointerItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad(){
    getMartyrsApi();
  }

  /// region === api
  void getMartyrsApi() async {
    apiLoading.value = true;
    final request = DigitalPointerRequest(roleId: 4, statusId: 2, pageNo: 1, orderBy: 'indicator desc');
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getContactsSearch(request);
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        martyrsList.assignAll(result?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }else{
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }
/// endregion === api
}