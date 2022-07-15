import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/answer_request.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/question_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/timeline_post_model.dart';
import 'package:hayah_karema/app/common/managers/api/home/_models/user_points_response.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/routes/app_pages.dart';
import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  final _cacheManager = DI.find<ICacheManager>();
  final _apiManager = DI.find<IHomeApiManager>();
  final _action = ActionCenter();

  final postApiLoading = false.obs;
  final pointsApiLoading = false.obs;
  final questionApiLoading = false.obs;
  final sendAnswerLoading = false.obs;

  RxList<TimelinePostModel> timelinePostsList = <TimelinePostModel>[].obs;
  RxList<QuestionResponse> questionsList = <QuestionResponse>[].obs;
  RxString availablePoints = ''.obs;

  var isSelected = false.obs;

  String? selectedAnswer ;

  @override
  void onInit() {
    super.onInit();
    _onLoad();
  }

  void _onLoad() async {
    await _getUserData();
    _getTimelinePostsAPI();
    _getQuestionAPI();
    _getUserPointsAPI();
  }

  Future<void> onRefresh() async{
    _getTimelinePostsAPI();
    _getQuestionAPI();
    _getUserPointsAPI();
  }

  onRefreshUserPoints(){
    _getUserPointsAPI();
  }

  Future<void> _getUserData() async {
    await _cacheManager.init();
  }

  void changeColorBtLike() {
    // isSelected.value = !isSelected.value;
    // update();
  }

  void goToNewPostView() {
    Get.toNamed(Routes.NEW_POST)?.then((value) {
      if(value!= null && value == true){
        onRefresh();
      }
    });
  }

  void goToCommentView() {
    Get.toNamed(Routes.COMMENTS);
  }

  void onChangeAnswer(String? value) {
    selectedAnswer = value;
    questionsList.refresh();
  }

  void _getTimelinePostsAPI() async {
    postApiLoading.value = true;

    List<TimelinePostModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getTimelinePosts(isApproved: true, orderBy: 'date desc', pageSize: 100, pageNumber: 1);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        if(timelinePostsList.isNotEmpty) timelinePostsList.clear();
        timelinePostsList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getQuestionAPI() async {
    questionApiLoading.value = true;
    final userData = _cacheManager.getUserData();
    List<QuestionResponse>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getQuestions(userId: '${userData?.id}');
    }, checkConnection: true);
    //
    questionApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        questionsList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getUserPointsAPI() async {
    pointsApiLoading.value = true;
    final userData = _cacheManager.getUserData();
    UserPointsResponse? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getUserPoints(userId: '${userData?.id}');
    }, checkConnection: true);
    //
    pointsApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        availablePoints.value = '${result?.available_points}';
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void sendAnswerBtnClick() async{
    if(selectedAnswer == null || selectedAnswer!.isEmpty) {
      OverlayHelper.showErrorToast('برجاء قم باختيار الإجابة أولاً');
      return;
    }
    sendAnswerLoading.value = true;
    final userData = _cacheManager.getUserData();
    var result;
    var success = await _action.execute(() async {
      QuestionResponse question = questionsList.firstWhere((e) => e.answer_option_text == selectedAnswer);
      result = await _apiManager.postAnswer(AnswerRequest(userId: userData!.id, questionId: '${question.question_id}', answerOptionId: '${question.answer_option_id}'));
    }, checkConnection: true);
    //
    sendAnswerLoading.value = false;
    //
    if (success) {
      if (result != null) {
        String res = result["result"];
        if(res.isNotEmpty){
          var icon = Icon(Icons.close, color: AppColors.current.neutral);
          var bgColor = AppColors.current.error;
          if(res.contains('10') || res.contains('نقاط')){
            _getUserPointsAPI();
            icon = Icon(Icons.done, color: AppColors.current.neutral);
            bgColor = AppColors.current.success;
          }
          Get.snackbar(
              '',
              '',
              icon: icon,
              snackPosition: SnackPosition.TOP,
              backgroundColor: bgColor,
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              shouldIconPulse: false,
              titleText: Text(res, style: TextStyle(color: AppColors.current.neutral, fontSize: Get.textTheme.headline3?.fontSize, fontWeight: FontWeight.bold),)
          );
          questionsList.clear();
          selectedAnswer = '';
          _getQuestionAPI();
        }
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void sharePost({required TimelinePostModel post}) {
    if(post.attachments!=null && post.attachments!.isNotEmpty){
      List<String> attachmentsPaths = post.attachments!.map((e) => e.fileName??'').toList();
      Share.share('${post.userName} ينشر : ${post.post}\n\n $attachmentsPaths', subject: 'حياة كريمة');
    }else{
      Share.share('${post.userName} ينشر : ${post.post}', subject: 'حياة كريمة');
    }
  }

}
