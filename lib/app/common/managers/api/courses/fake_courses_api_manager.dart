import 'package:hayah_karema/app/common/managers/api/courses/_models/available_course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/course_model.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/join_training_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/_models/register_course_request.dart';
import 'package:hayah_karema/app/common/managers/api/courses/i_courses_api_manager.dart';

class FakeCourseApiManager implements ICoursesApiManager{

  @override
  Future<List<TrainingCourseModel>?> getAllCourses() async{
    await Future.delayed(const Duration(seconds: 2));
    return [TrainingCourseModel()];
  }

  @override
  Future<List<AvailableCourseModel>?> getAvailableCourses(String? programId) async{
    await Future.delayed(const Duration(seconds: 2));
    return [AvailableCourseModel()];
  }

  @override
  Future joinNow(RegisterCourseRequest? courseRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }

  @override
  Future joinTrainingRequest(JoinTrainingRequest? trainingRequest) async{
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }


}