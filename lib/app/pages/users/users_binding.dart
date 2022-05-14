import 'package:get/get.dart';
import 'package:hayah_karema/app/pages/auth/new_password/new_password_controller.dart';

import 'users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}
