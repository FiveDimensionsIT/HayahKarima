import 'package:hayah_karema/app/common/managers/api/auth/_model/login_model.dart';

import 'i_auth_api_manager.dart';

class FakeAuthApiManager implements IAuthApiManager{
  @override
  Future<LoginResponse?> login(LoginRequest? loginRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return LoginResponse();
  }

}