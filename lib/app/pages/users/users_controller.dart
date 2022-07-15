import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/change_password_request.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/user_status_request.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/global_status_response.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'package:rxdart/rxdart.dart';

class UsersController extends GetxController {
  final _cacheManager = DI.find<ICacheManager>();
  final PublishSubject<String> _searchTextController = PublishSubject();

  RxBool userApiLoading = false.obs;
  RxBool actioApiLoading = false.obs;
  final _apiManager = DI.find<IUserApiManager>();
  final _action = ActionCenter();
  RxList<PointerItemModel> usersList = <PointerItemModel>[].obs;
  RxList<PointerItemModel> allUsersList = <PointerItemModel>[].obs;
  final List<LookupModel> _contactStatusList = <LookupModel>[];

  @override
  void onInit() {
    super.onInit();
    _cacheManager.init();
    _getAllUsers();
    _getContactStatusLookup();
    _searchListener();
  }

  void onRefresh(){
    _getAllUsers();
  }

  @override
  void onClose() {
    _searchTextController.close();
    super.onClose();
  }

  void filterUsers(String userName) {
    if (userName.isEmpty) {
      usersList.clear();
      usersList.assignAll(allUsersList);
      usersList.refresh();
      return;
    }
    _searchTextController.sink.add(userName);
  }

  void _searchListener() {
    _searchTextController.stream
        .debounce((_) => TimerStream(true, const Duration(milliseconds: 500)))
        .switchMap((val) async* {
      yield val;
    }).listen((result) {
      final list = allUsersList.where((u) =>
      u.fullName!.toLowerCase().contains(result.toLowerCase()) || u.barcode!.contains(result.toLowerCase()));
      usersList.clear();
      usersList.assignAll(list);
      usersList.refresh();
    });
  }


  void onChangeStatus(int? contactId, String? statusName) {
    _changeStatusAPI(contactId, statusName);
  }

  void onChangePasswordBtnClick(int? contactId, String? newPassword){
    _changePasswordAPI(contactId, newPassword);
  }

  void _getContactStatusLookup() async {
    userApiLoading.value = true;

    List<LookupModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.contactStatusLookup();
    }, checkConnection: true);
    //
    userApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        _contactStatusList.addAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getAllUsers() async {
    userApiLoading.value = true;
    String? userId = _cacheManager.getUserData()?.id;
    List<PointerItemModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getAllUsers(userId);
    }, checkConnection: true);
    //
    userApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        allUsersList.assignAll(result ?? []);
        usersList.assignAll(allUsersList.reversed.toList());
      }
    }else{
      OverlayHelper.showErrorToast(AppText.somethingWrong);
    }
  }

  void _changeStatusAPI(int? contactId, String? statusName) async {
    actioApiLoading.value = true;
    int index = _contactStatusList.indexWhere((s) => s.name == statusName, -1);

    if(index==-1) {
      OverlayHelper.showErrorToast('Status/Search API هناك خطأ في ');
      return;
    }

    GlobalStatusResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.updateUserStatus(UserStatusRequest(id: contactId, statusId: _contactStatusList[index].id));
    }, checkConnection: true);
    //
    actioApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        if(result?.statusId == '1'){
          OverlayHelper.showSuccessToast(result?.message??'');
          int userIndex = usersList.indexWhere((user) => user.id == contactId, -1);
          if(userIndex>-1) {
            usersList[userIndex].statusObs.value = result?.statusName??'';
            usersList[userIndex].status = result?.statusName;
          }
        }else{
          OverlayHelper.showErrorToast(result?.message??'');
        }
      }
    }else{
      OverlayHelper.showErrorToast(AppText.somethingWrong);
    }
  }

  void _changePasswordAPI(int? contactId, String? newPassword) async {
    actioApiLoading.value = true;

    GlobalStatusResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.changePassword(ChangePasswordRequest(contactId: contactId, password: newPassword));
    }, checkConnection: true);
    //
    actioApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        if(result?.statusId == '1'){
          OverlayHelper.showSuccessToast(result?.message??'');
        }else{
          OverlayHelper.showErrorToast(result?.message??'');
        }
      }
    }else{
      OverlayHelper.showErrorToast(AppText.somethingWrong);
    }
  }

}
