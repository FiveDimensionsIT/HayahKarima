import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/available_course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/register_course_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/i_courses_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'package:rxdart/rxdart.dart';

class TrainingCourseController extends GetxController {
  RxList<TrainingCourseModel> coursesList = <TrainingCourseModel>[].obs;
  List<TrainingCourseModel> allCoursesList = <TrainingCourseModel>[];

  RxList<AvailableCourseModel> availableCourses = <AvailableCourseModel>[].obs;

  final _cacheManager = DI.find<ICacheManager>();
  RxBool apiLoading = false.obs;
  RxBool postApiLoading = false.obs;
  final _apiManager = DI.find<ICoursesApiManager>();
  final _action = ActionCenter();

  final PublishSubject<String> _searchTextController = PublishSubject();

  @override
  void onInit() async {
    super.onInit();

    await _cacheManager.init();
    _getCoursesApi();
    _searchListener();
  }

  void filterCourse(String courseName) {
    if(courseName.isEmpty){
      coursesList.clear();
      coursesList.assignAll(allCoursesList);
      coursesList.refresh();
      return;
    }
    _searchTextController.sink.add(courseName);
  }

  void _searchListener() {
    _searchTextController.stream
        .debounce((_) => TimerStream(true, const Duration(milliseconds: 500)))
        .switchMap((val) async* {
      debugPrint("==>> Search result :: $val");
      yield val;
    }).listen((result) {
      final list = allCoursesList.where((c) => c.category!.toLowerCase().contains(result.toLowerCase()) || c.name!.toLowerCase().contains(result.toLowerCase()));
      coursesList.clear();
      coursesList.assignAll(list);
      coursesList.refresh();
    });
  }

  void joinNow(String programId) {
    _getAvailableCourses(programId);
  }

  void _getCoursesApi() async {
    apiLoading.value = true;
    List<TrainingCourseModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getAllCourses();
    }, checkConnection: true);
    //
    apiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        coursesList.assignAll(result ?? []);
        allCoursesList.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _getAvailableCourses(String programId) async {
    postApiLoading.value = true;
    List<AvailableCourseModel>? result;
    var success = await _action.execute(() async {
      result = await _apiManager.getAvailableCourses(programId);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        availableCourses.assignAll(result ?? []);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _joinNowApi() async {
    postApiLoading.value = true;
    final userData = _cacheManager.getUserData();
    RegisterCourseRequest courseRequest = RegisterCourseRequest(userId: userData?.id, courseId: 0, registrationDate: '');
    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.joinNow(courseRequest);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {

      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

}
