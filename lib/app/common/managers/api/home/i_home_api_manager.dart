import 'package:hayah_karema/app/common/managers/api/home/_models/answer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/digital_pointer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/gallery_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/martyrs_prayers_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/my_village_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/pointer_item_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/timeline_post_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';

abstract class IHomeApiManager{

  Future<List<PointerItemModel>?> getStatisticNumber(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getProvincesPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getCentersPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getVillagesPointer(DigitalPointerRequest pointerRequest);

  Future<List<PointerItemModel>?> getContactsSearch(DigitalPointerRequest pointerRequest);

  Future<List<GalleryModel>?> getContactsGallery(int contactId);

  Future<List<PointerItemModel>?> getCategoriesPointer(DigitalPointerRequest pointerRequest);

  Future<List<TimelinePostModel>?> getTimelinePosts({bool? isApproved, int? pageNumber, int? pageSize, String? orderBy});

  Future<UserPointsResponse?> getUserPoints({String? userId});

  Future<List<QuestionResponse>?> getQuestions({String? userId});

  Future postAnswer(AnswerRequest? answerRequest);

  Future<MyVillageModel?> getMyVillage(String? villageId);

  Future postPrayingForMartyrs(MartyrsPrayersRequest? request);
}