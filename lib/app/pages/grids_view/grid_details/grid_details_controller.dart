import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/models/enums/contacts_enum.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

class GridDetailsController extends GetxController {
  var galleryApiLoading = false.obs;
  var apiLoading = false.obs;
  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();
  List<GalleryModel> galleryList = <GalleryModel>[].obs;

  var contactsEnum = Get.arguments["ContactsEnum"];
  var pointerItemModel = Get.arguments["PointerItemModel"];

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad() {
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
    await Future.delayed(const Duration(seconds: 3));

    const myVillage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGC8Je5wJBmdwxtHPJ6D91cHjgPrRkZxicWIBw3n-PghZ_5l3eL9_W7o8uzIw3a37XKhA&usqp=CAU';
    pointerItemModel = PointerItemModel(
        id: 0,
        avatar: myVillage,
        village: 'محافظة كفر الشيخ',
        fullName: 'قرية الزعفران',
        center: 'مركز الحامول',
        villagePeople: '213523',
        villagePoints: '241221',
        biography:
            'أنشئت القرية عام 1912 باسم الأبعادية القبلية، وفي عام 1925 تم تغيير اسمها إلى اسمها الحالي، وذلك لأن أراضيها كانت ملك الحكومة المصرية، وباعتها الحكومة إلى الملك فؤاد الأول، واشترت بثمن الأراض سراي الزعفران بالقاهرة، لذلك رأت الخاصة الملكية تسمية البلدة بالزعفران إحياء لذكرى سراي الزعفران التي أعطيت بدلاً منها بلغ عدد سكان الزعفران 22240 نسمة حسب الإحصاء الرسمى لعام 2006.');
    getGalleryApi(5);

    apiLoading.value = false;
  }

  /// endregion === api

}
