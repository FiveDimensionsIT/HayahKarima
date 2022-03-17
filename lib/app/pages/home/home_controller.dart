import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/setup.dart';


class HomeController extends GetxController {


  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();

  var isSelected=false.obs;

  void changeColorBtLike(){

    isSelected.value = !isSelected.value;
      update();
    }

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  _onLoad() {

  }


  goToNewPostView(){
    Get.toNamed(Routes.NEW_POST);
  }
  goToCommentView(){
    Get.toNamed(Routes.COMMENTS);
  }
  var answer = "".obs;
  onChangeAnswer(var value){
    answer.value = value;
  }
}
