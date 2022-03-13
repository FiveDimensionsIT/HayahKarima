import 'package:get/get.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';

class NotificationController extends GetxController {
  RxList<GenericModel> tabList = <GenericModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    _initTabList();
  }

  void _initTabList() {
    final list = <GenericModel>[
      GenericModel(id: 0, title: 'الكل'.tr, isSelected: true),
      GenericModel(id: 1, title: 'الغير مقروءة'.tr, isSelected: false)
    ];

    tabList.assignAll(list);
    tabList.refresh();
  }

  void onTabClick(int index){
    tabList[tabList.indexWhere((element) => element.isSelected == true)].isSelected = false;
    tabList[index].isSelected = true;
    tabList.refresh();
  }
}
