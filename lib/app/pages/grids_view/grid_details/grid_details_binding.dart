import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/grids_view/grid_details/grid_details_controller.dart';

class GridDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<GridDetailsController>(
          () => GridDetailsController(),
    );
  }

}