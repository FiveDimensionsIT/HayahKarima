import 'package:get/get.dart';

class HomeController extends GetxController {

  final provincesList = [].obs;
  final centersList = [].obs;
  final countrysidesList = [].obs;
  final citizensList = [].obs;
  final typesList = [].obs;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  navigateToBack() {

  }

  _onLoad(){
    _initPointersList();
  }

  void _initPointersList() {

    provincesList.assignAll([
      {'name': 'القاهرة', 'value': '848.456', 'percentage': Get.width * 0.8},
      {'name': 'الدقهلية', 'value': '639.625', 'percentage': Get.width * 0.6},
      {'name': 'الاسكندرية', 'value': '554.123', 'percentage': Get.width * 0.4},
      {'name': 'شمال سيناء', 'value': '128.876', 'percentage': Get.width * 0.4},
      {'name': 'مرسي مطروح', 'value': '58.873', 'percentage': Get.width * 0.2},
    ]);
    provincesList.refresh();

    centersList.assignAll([
      {'name': 'دسوق', 'value': '848.456', 'percentage': Get.width * 0.8},
      {'name': 'مطوبس', 'value': '639.625', 'percentage': Get.width * 0.6},
      {'name': 'البرنس', 'value': '554.123', 'percentage': Get.width * 0.4},
      {'name': 'بيلا', 'value': '128.876', 'percentage': Get.width * 0.4},
      {'name': 'الرياض', 'value': '58.873', 'percentage': Get.width * 0.5},
    ]);
    centersList.refresh();

    countrysidesList.assignAll([
      {'name': 'ابو طرطور', 'value': '848.456', 'percentage': Get.width * 0.8},
      {'name': 'الخادمية', 'value': '639.625', 'percentage': Get.width * 0.6},
      {'name': 'الشارقة', 'value': '554.123', 'percentage': Get.width * 0.4},
      {'name': 'الطايفة', 'value': '128.876', 'percentage': Get.width * 0.4},
      {'name': 'القرضا', 'value': '58.873', 'percentage': Get.width * 0.5},
    ]);
    countrysidesList.refresh();

    citizensList.assignAll([
      {'name': 'مسعد العربي', 'value': '848.456', 'percentage': Get.width * 0.8},
      {'name': 'سلامة عباس', 'value': '639.625', 'percentage': Get.width * 0.6},
      {'name': 'اشرف خالد', 'value': '554.123', 'percentage': Get.width * 0.4},
      {'name': 'ابانوب مجدي', 'value': '128.876', 'percentage': Get.width * 0.4},
      {'name': 'مها الحسيني', 'value': '58.873', 'percentage': Get.width * 0.5},
    ]);
    citizensList.refresh();

    typesList.assignAll([
      {'name': 'تكنو-معرفي', 'value': '848.456', 'percentage': Get.width * 0.8},
      {'name': 'تكنو-اجتماعي', 'value': '639.625', 'percentage': Get.width * 0.6},
      {'name': 'تكنو-اقتصادي', 'value': '554.123', 'percentage': Get.width * 0.4},
      {'name': 'تكنو-رياضي', 'value': '128.876', 'percentage': Get.width * 0.4},
      {'name': 'تكنو-ثقافي', 'value': '58.873', 'percentage': Get.width * 0.5},
    ]);
    typesList.refresh();
  }
}
