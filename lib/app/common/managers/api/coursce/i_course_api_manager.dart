import 'package:hayah_karema/app/common/managers/api/coursce/_model/course_model.dart';

abstract class ICourseAPIManager{

  Future<List<CourseModel>?> getCoursesData();

}