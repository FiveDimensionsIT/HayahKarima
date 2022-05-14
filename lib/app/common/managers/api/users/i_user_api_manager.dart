import 'package:hayah_karema/app/common/managers/api/users/_models/add_user_data.dart';
import 'package:hayah_karema/app/common/managers/api/users/_models/register_user_response.dart';
import 'package:hayah_karema/app/common/models/lookup_model.dart';

abstract class IUserApiManager{

  Future<RegisterUserResponse?> registerUser(AddUserData userData);
  Future<List<LookupModel>?> healthStatusLookup();
  Future<List<LookupModel>?> genderLookup();
  Future<List<LookupModel>?> educationStatusLookup();

  Future<List<LookupModel>?> governoratesLookup();
  Future<List<LookupModel>?> centersLookup(String id);
  Future<List<LookupModel>?> villagesLookup(String id);

  Future getAllUsers();

}