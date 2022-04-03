import 'package:hayah_karema/app/common/managers/api/courses/_models/available_course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/register_course_request.dart';

abstract class ICoursesApiManager{

  Future<List<TrainingCourseModel>?> getAllCourses();

  Future<List<AvailableCourseModel>?> getAvailableCourses(String? programId);

  Future joinNow(RegisterCourseRequest? courseRequest);

}