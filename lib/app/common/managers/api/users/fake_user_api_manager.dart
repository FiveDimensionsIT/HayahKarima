import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/add_user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/register_user_response.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/user_status_request.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';

class FakeUserApiManager implements IUserApiManager {

  @override
  Future<List<PointerItemModel>?> getAllUsers(String? userId) async{
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<RegisterUserResponse?> registerUser(AddUserData userData) async{
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> educationStatusLookup() async{
    // TODO: implement educationStatusLookup
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> genderLookup() async{
    // TODO: implement genderLookup
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> healthStatusLookup() async{
    // TODO: implement healthStatusLookup
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> governoratesLookup() {
    // TODO: implement governoratesLookup
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> centersLookup(String id) {
    // TODO: implement centersLookup
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> villagesLookup(String id) {
    // TODO: implement villagesLookup
    throw UnimplementedError();
  }

  @override
  Future updateUserStatus(UserStatusRequest userStatusRequest) async{
    throw UnimplementedError();
  }

  @override
  Future<List<LookupModel>?> contactStatusLookup()async{
    // TODO: implement contactStatusLookup
    throw UnimplementedError();
  }

}