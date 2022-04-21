import 'package:hayah_karema/app/common/managers/api/coursce/_model/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/coursce/i_course_api_manager.dart';

class FakeCourseAPIManager implements ICourseAPIManager{

  @override
  Future<List<CourseModel>?> getCoursesData() async{
    await Future.delayed(const Duration(seconds: 2));
    return [CourseModel()];
  }

}