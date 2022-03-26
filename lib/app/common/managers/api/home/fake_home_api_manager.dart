import 'package:hayah_karema/app/common/managers/api/home/_models/answer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/martyrs_prayers_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/my_village_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/timeline_post_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';

class FakeHomeApiManager implements IHomeApiManager{

  @override
  Future<List<PointerItemModel>?> getStatisticNumber(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

@override
  Future<List<PointerItemModel>?> getCategoriesPointer(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

  @override
  Future<List<PointerItemModel>?> getCentersPointer(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

  @override
  Future<List<PointerItemModel>?> getContactsSearch(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

  @override
  Future<List<PointerItemModel>?> getVillagesPointer(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

  @override
  Future<List<PointerItemModel>?> getProvincesPointer(DigitalPointerRequest pointerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return [PointerItemModel()];
  }

  @override
  Future<List<GalleryModel>?> getContactsGallery(int contactId) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<List<TimelinePostModel>?> getTimelinePosts({bool? isApproved, int? pageNumber, int? pageSize, String? orderBy}) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<MyVillageModel?> getMyVillage(String? villageId) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future postPrayingForMartyrs(MartyrsPrayersRequest? request) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<List<QuestionResponse>?> getQuestions({String? userId}) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<UserPointsResponse?> getUserPoints({String? userId}) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future postAnswer(AnswerRequest? answerRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

}