import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/setup.dart';


class HomeController extends GetxController {


  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();

  RxBool colorButtonChange = false.obs;
  var plantAntigensSelected = [].obs;

  toogle(int index) {
    if (plantAntigensSelected.contains(index)) {
      plantAntigensSelected.remove(index);
    } else {
      plantAntigensSelected.add(index);
    }
  }

  changeColorButton(){
    colorButtonChange !=colorButtonChange;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  _onLoad() {

  }

}
