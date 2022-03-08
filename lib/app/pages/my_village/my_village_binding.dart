import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/my_village/my_village_conroller.dart';

class MyVillageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyVillageController>(() =>
        MyVillageController());
  }


}