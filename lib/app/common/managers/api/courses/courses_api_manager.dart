import 'dart:convert';

import 'package:hayah_karema/app/common/managers/api/courses/_models/available_course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/register_course_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/i_courses_api_manager.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class CourseApiManager implements ICoursesApiManager{

  final IHttpService _httpService;

  CourseApiManager(this._httpService);

  @override
  Future<List<TrainingCourseModel>?> getAllCourses() async{
    var request = HttpRequest(method: HttpMethod.get, url: 'Training/Programs/Search?statusId=2',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<TrainingCourseModel>.from(jsonDecode(resp.data!).map((x) => TrainingCourseModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future<List<AvailableCourseModel>?> getAvailableCourses(String? programId) async{
    var request = HttpRequest(method: HttpMethod.get, url: 'Training/Courses/Search?programId=$programId&available=true',)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<AvailableCourseModel>.from(jsonDecode(resp.data!).map((x) => AvailableCourseModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }

  @override
  Future joinNow(RegisterCourseRequest? courseRequest) async{
    var request = HttpRequest(method: HttpMethod.post, url: 'Training/Registrations', data: courseRequest)..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return jsonDecode(resp.data!);
    }
    return null;
  }



}