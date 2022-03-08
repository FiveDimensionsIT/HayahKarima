import 'package:hayah_karema/app/common/managers/api/auth/_model/login_model.dart';

abstract class IAuthApiManager{

  Future<LoginResponse?> login(LoginRequest loginRequest);

}