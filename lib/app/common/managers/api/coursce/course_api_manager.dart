import 'dart:convert';
import 'package:hayah_karema/app/common/managers/api/coursce/_model/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/coursce/i_course_api_manager.dart';
import 'package:hayah_karema/services/http/i_http_service.dart';
import 'package:hayah_karema/services/http/http_lib.dart';

class CourseAPIManager implements ICourseAPIManager{

  final IHttpService _httpService;

  CourseAPIManager(this._httpService);

  @override
  Future<List<CourseModel>?> getCoursesData() async {

    var request = HttpRequest(
      method: HttpMethod.get,
      url: 'Training/Programs/Search',
    )..addJsonHeaders();
    //
    var resp = await _httpService.sendRequest(request);
    //
    if (resp != null && resp.statusCode == 200 && resp.data != null) {
      return List<CourseModel>.from(
          json.decode(resp.data!).map((x) => CourseModel()..deserialize(jsonEncode(x))));
    }
    return null;
  }



}