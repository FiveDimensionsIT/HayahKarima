import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

class GridDetailsController extends GetxController{

  var apiLoading = false.obs;
  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();
  List<GalleryModel> galleryList = <GalleryModel>[].obs;


  /// region === api
  void getGalleryApi(int contactId) async {
    apiLoading.value = true;
    if(galleryList.isNotEmpty) galleryList.clear();

    List<GalleryModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getContactsGallery(contactId);
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        galleryList.assignAll(result??[]);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }else{
      OverlayHelper.showErrorToast(AppText.unHandledErrorAction);
    }
  }
/// endregion === api


}