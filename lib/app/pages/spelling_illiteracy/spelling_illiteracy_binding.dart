import 'package:get/get.dart';

import 'spelling_illiteracy_controller.dart';

class SpellingIlliteracyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpellingIlliteracyController>(
      () => SpellingIlliteracyController(),
    );
  }
}
