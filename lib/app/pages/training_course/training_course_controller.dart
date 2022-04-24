import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/app/common/action_center/action_center.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/available_course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/join_training_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/register_course_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/i_courses_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/app/common/models/generic_model.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/app/pages/training_course/views/available_courses_view.dart';
import 'package:hayah_karema/app/pages/training_course/views/register_course_view.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/DateHelper.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'package:rxdart/rxdart.dart';

class TrainingCourseController extends GetxController {
  RxList<TrainingCourseModel> coursesList = <TrainingCourseModel>[].obs;
  List<TrainingCourseModel> allCoursesList = <TrainingCourseModel>[];
  List<GenericModel> trainingTypes = [
    GenericModel(id: 1, title: 'وجها لوجه'),
    GenericModel(id: 2, title: 'اونلاين'),
    GenericModel(id: 3, title: 'وجها لوجه/ اونلاين'),
  ];
  RxInt selectTrainingType = 0.obs;

  List<String> daysList = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  String? selectedDay;

  final TextEditingController fromAvailableController = TextEditingController();
  final TextEditingController toAvailableController = TextEditingController();
  final TextEditingController fromRequiredController = TextEditingController();
  final TextEditingController toRequiredController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  TimeOfDay? selectedFromAvailableTime;
  TimeOfDay? selectedToAvailableTime;
  DateTime? selectedFromRequiredDay;
  DateTime? selectedToRequiredDay;

  final _cacheManager = DI.find<ICacheManager>();
  RxBool apiLoading = false.obs;
  RxBool postApiLoading = false.obs;
  final _apiManager = DI.find<ICoursesApiManager>();
  final _action = ActionCenter();
  RxString selectCourseDate = ''.obs;

  final PublishSubject<String> _searchTextController = PublishSubject();

  @override
  void onInit() async {
    super.onInit();
    await _cacheManager.init();
    _getCoursesApi();
    _searchListener();
  }

  @override
  void onClose() {
    fromAvailableController.dispose();
    toAvailableController.dispose();
    fromRequiredController.dispose();
    toRequiredController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void filterCourse(String courseName) {
    if (courseName.isEmpty) {
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
      final list = allCoursesList.where((c) =>
          c.category!.toLowerCase().contains(result.toLowerCase()) ||
          c.name!.toLowerCase().contains(result.toLowerCase()));
      coursesList.clear();
      coursesList.assignAll(list);
      coursesList.refresh();
    });
  }

  void selectTimePicker(Function onTimeSelected) {
    showTimePicker(context: Get.context!, initialTime: TimeOfDay.now()).then((selectedTime) {
      if (selectedTime == null) return;
      onTimeSelected(selectedTime);
    });
  }

  void selectDayPicker(Function onDateSelected) {
    final cDate = DateTime.now();
    final lastDate = DateTime(cDate.year, cDate.month + 12, cDate.day);
    showDatePicker(context: Get.context!, initialDate: cDate, lastDate: lastDate, firstDate: cDate).then((selectedDay) {
      if (selectedDay == null) return;
      onDateSelected(selectedDay);
    });
  }

  void joinToAvailableCourse({required int courseId}) {
    if (selectCourseDate.value.isEmpty) {
      OverlayHelper.showErrorToast('من فضلك قم باختيار الميعاد أولاً');
      return;
    }
    _joinNowApi(courseId: courseId, registrationDate: selectCourseDate.value);
  }

  void onSelectCourseDate({String? dateId}) {
    if (dateId == null) return;
    selectCourseDate.value = dateId;
  }

  void onSelectTrainingType({int? trainingTypeId}) {
    if (trainingTypeId == null) return;
    selectTrainingType.value = trainingTypeId;
  }

  void getAvailableCourses({required String programId, required String programName}) {
    _getAvailableCourses(programId, programName);
  }

  void onJoinTrainingRequestBtnClick(String programId) {
    if (selectTrainingType.value == 0 ||
        selectedDay == null ||
        selectedFromAvailableTime == null ||
        selectedToAvailableTime == null ||
        selectedFromRequiredDay == null ||
        selectedToRequiredDay == null ||
        notesController.text.isEmpty) {
      OverlayHelper.showErrorToast('من فضلك تاكد من إدخال جميع البيانات');
      return;
    }

    if (timeToDouble(selectedFromAvailableTime!) >= timeToDouble(selectedToAvailableTime!)) {
      OverlayHelper.showErrorToast('برجاء التأكد من إدخال وقت المواعيد المتاحة صحيحاً');
      return;
    }

    if (selectedFromRequiredDay!.isAfter(selectedToRequiredDay!) ||
        selectedFromRequiredDay!.isAtSameMomentAs(selectedToRequiredDay!)) {
      OverlayHelper.showErrorToast('برجاء التأكد من إدخال ايام الفترات المطلوبة صحيحاً');
      return;
    }

    final userData = _cacheManager.getUserData();
    final userId = userData?.id;
    final requestDate = DateTime.now().toIso8601String();
    final availableAppointments = [
      AvailableAppointmentModel(
          day: selectedDay,
          timeFrom: timeToString(selectedFromAvailableTime!),
          timeTo: timeToString(selectedToAvailableTime!))
    ];
    final requiredPeriod = [
      RequiredPeriodModel(
          dateFrom: selectedFromRequiredDay?.toIso8601String(), dateTo: selectedToRequiredDay?.toIso8601String())
    ];
    final trainingTypeId = selectTrainingType.value;
    final notes = notesController.text;

    JoinTrainingRequest request = JoinTrainingRequest(
        programId: programId,
        availableAppointments: availableAppointments,
        requestDate: requestDate,
        requiredPeriod: requiredPeriod,
        trainingTypeId: trainingTypeId,
        userId: userId,
        userNotes: notes);

    _joinTrainingRequestApi(trainingRequest: request);
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

  void _getAvailableCourses(String programId, String programName) async {
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
        if (result != null && result!.isNotEmpty) {
          Get.to(() => AvailableCoursesView(coursesList: result!));
        } else {
          Get.to(() => RegisterCoursesView(programId: programId, programName: programName));
        }
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _joinNowApi({required int courseId, required String registrationDate}) async {
    postApiLoading.value = true;
    final userData = _cacheManager.getUserData();
    RegisterCourseRequest courseRequest =
        RegisterCourseRequest(userId: userData?.id, courseId: courseId, registrationDate: registrationDate);
    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.joinNow(courseRequest);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        OverlayHelper.showInfoToast(result['message']);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  void _joinTrainingRequestApi({required JoinTrainingRequest trainingRequest}) async {
    postApiLoading.value = true;
    var result;
    var success = await _action.execute(() async {
      result = await _apiManager.joinTrainingRequest(trainingRequest);
    }, checkConnection: true);
    //
    postApiLoading.value = false;
    //
    if (success) {
      if (result != null) {
        if (result['message'].toString().contains('استلمنا طلبك')) {
          _clearData();
        }

        OverlayHelper.showInfoToast(result['message']);
      } else {
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
    }
  }

  _clearData() {
    fromAvailableController.clear();
    toAvailableController.clear();
    fromRequiredController.clear();
    toRequiredController.clear();
    notesController.clear();

    selectTrainingType.value = 0;
    selectedDay = null;
    selectedFromAvailableTime = null;
    selectedToAvailableTime = null;
    selectedFromRequiredDay = null;
    selectedToRequiredDay = null;


  }
}
