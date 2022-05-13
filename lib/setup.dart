import 'package:get_it/get_it.dart';
import 'package:hayah_karema/app/common/managers/api/auth/auth_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/auth/fake_auth_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/auth/i_auth_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/courses/courses_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/courses/fake_courses_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/courses/i_courses_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/home/fake_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/home/home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/home/i_home_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/post/fake_post_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/post/i_post_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/post/post_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/fake_profile_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/i_profile_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/profile/profile_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/fake_rewards_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/i_rewards_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/rewards/rewards_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/users/fake_user_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/users/i_user_api_manager.dart';
import 'package:hayah_karema/app/common/managers/api/users/user_api_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/cache_manager.dart';
import 'package:hayah_karema/app/common/managers/cache/i_cache_manager.dart';
import 'package:hayah_karema/services/connectivity/connectivity_lib.dart';
import 'package:hayah_karema/services/firebase_phone_auth/firebase_phone_auth.dart';
import 'package:hayah_karema/services/firebase_phone_auth/i_firebase_phone_auth.dart';
import 'package:hayah_karema/services/http/dio_http_service.dart';
import 'package:hayah_karema/services/http/http_lib.dart';
import 'package:hayah_karema/services/logger/abs_logger.dart';
import 'package:hayah_karema/services/logger/debug_logger.dart';
import 'package:hayah_karema/services/logger/fake_logger.dart';
import 'package:hayah_karema/services/persistence/cache/abs_cache_service.dart';
import 'package:hayah_karema/services/persistence/cache/fake_cache_service.dart';
import 'package:hayah_karema/services/persistence/cache/local_cache_service.dart';
import 'package:hayah_karema/services/url_launcher/i_url_launcher_service.dart';
import 'package:hayah_karema/services/url_launcher/url_launcher_service.dart';

import 'main.dart';

bool demoMode = false;

void setup() {
  // region ==== services ====
  // logger
  if (BUILD_TYPE == BuildType.debug) {
    DI.setSingleton<AbsLogger>(() => DebugLogger()..enableAnsiColors(false));
  } else {
    DI.setSingleton<AbsLogger>(() => FakeLogger());
  }
  // cache service
  DI.setSingleton<AbsCacheService>(() => LocalCacheService());
  // file service
  //DI.setSingleton<IFileService>(() => FileService());
  // connectivity service
  DI.setSingleton<IConnectivityService>(() => ConnectivityService());
  // http
  DI.setSingleton<IHttpService>(() => DioHttpService());
  // url launcher service
  DI.setSingleton<IUrlLauncherService>(() => UrlLauncherService());
  // firebase phone auth service
  DI.setSingleton<IFirebasePhoneAuth>(() => FirebasePhoneAuth());
  // endregion  ==== services ====

  // region ==== managers ====
  DI.setSingleton<ICacheManager>(() => CacheManager(DI.find()));
  // auth api manager
  DI.setSingleton<IAuthApiManager>(() => AuthApiManager(DI.find()));
  // home manager
  DI.setSingleton<IHomeApiManager>(() => HomeApiManager(DI.find()));
  // post manager
  DI.setSingleton<IPostApiManager>(() => PostApiManager(DI.find()));
  // profile manager
  DI.setSingleton<IProfileAPIManager>(() => ProfileAPIManager(DI.find()));
  // rewards manager
  DI.setSingleton<IRewardsApiManager>(() => RewardsApiManager(DI.find()));
  // courses manager
  DI.setSingleton<ICoursesApiManager>(() => CourseApiManager(DI.find()));
  // users manager
  DI.setSingleton<IUserApiManager>(() => UserApiManager(DI.find()));
  // endregion  ==== managers ====

}

void setupDemoMode() {
  demoMode = true;
  //
  DI.remove<AbsCacheService>();
  DI.setSingleton<AbsCacheService>(() => FakeCacheService());
  //
  DI.remove<IAuthApiManager>();
  DI.setSingleton<IAuthApiManager>(() => FakeAuthApiManager());
  //
  DI.remove<IHomeApiManager>();
  DI.setSingleton<IHomeApiManager>(() => FakeHomeApiManager());
  //
  DI.remove<IPostApiManager>();
  DI.setSingleton<IPostApiManager>(() => FakePostApiManager());
  //
  DI.remove<IProfileAPIManager>();
  DI.setSingleton<IProfileAPIManager>(() => FakeProfileAPIManager());
  //
  DI.remove<IRewardsApiManager>();
  DI.setSingleton<IRewardsApiManager>(() => FakeRewardsApiManager());
  //
  DI.remove<ICoursesApiManager>();
  DI.setSingleton<ICoursesApiManager>(() => FakeCourseApiManager());
  //
  DI.remove<IUserApiManager>();
  DI.setSingleton<IUserApiManager>(() => FakeUserApiManager());

}

/// Dependency Injection wrapper
abstract class DI {
  DI._();

  static void setSingleton<T extends Object>(T Function() creator) {
    GetIt.I.registerLazySingleton<T>(creator);
  }

  static void setFactory<T extends Object>(T Function() creator) {
    GetIt.I.registerFactory<T>(creator);
  }

  static void remove<T extends Object>() {
    GetIt.I.unregister<T>();
  }

  static T find<T extends Object>() {
    return GetIt.I.get<T>();
  }
}
