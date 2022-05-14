import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/user_model.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';

class UsersController extends GetxController {

  void filterUsers(String value) {}

  @override
  void onInit() {
    super.onInit();
    // _getAllUsers();
  }

  RxBool userApiLoading = false.obs;
  final _apiManager = DI.find<IUserApiManager>();
  final _action = ActionCenter();
  RxList<UserModel> usersList = <UserModel>[].obs;


  void _getAllUsers() async {
    userApiLoading.value = true;
    List<UserModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getAllUsers();
    }, checkConnection: true);
    //
    userApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        usersList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }


}
