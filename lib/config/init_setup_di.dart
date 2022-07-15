import 'package:hayah_karema/config/app_config.dart';

import '../app/common/managers/api/auth/auth_api_manager.dart';
import '../app/common/managers/api/auth/fake_auth_api_manager.dart';
import '../app/common/managers/api/auth/i_auth_api_manager.dart';
import '../app/common/managers/api/courses/courses_api_manager.dart';
import '../app/common/managers/api/courses/fake_courses_api_manager.dart';
import '../app/common/managers/api/courses/i_courses_api_manager.dart';
import '../app/common/managers/api/home/fake_home_api_manager.dart';
import '../app/common/managers/api/home/home_api_manager.dart';
import '../app/common/managers/api/home/i_home_api_manager.dart';
import '../app/common/managers/api/post/fake_post_api_manager.dart';
import '../app/common/managers/api/post/i_post_api_manager.dart';
import '../app/common/managers/api/post/post_api_manager.dart';
import '../app/common/managers/api/profile/fake_profile_api_manager.dart';
import '../app/common/managers/api/profile/i_profile_api_manager.dart';
import '../app/common/managers/api/profile/profile_api_manager.dart';
import '../app/common/managers/api/rewards/fake_rewards_api_manager.dart';
import '../app/common/managers/api/rewards/i_rewards_api_manager.dart';
import '../app/common/managers/api/rewards/rewards_api_manager.dart';
import '../app/common/managers/api/users/fake_user_api_manager.dart';
import '../app/common/managers/api/users/i_user_api_manager.dart';
import '../app/common/managers/api/users/user_api_manager.dart';
import '../app/common/managers/cache/cache_manager.dart';
import '../app/common/managers/cache/i_cache_manager.dart';
import '../config/setup.dart';
import 'main_common.dart';
import '../services/connectivity/connectivity_lib.dart';
import '../services/firebase_phone_auth/firebase_phone_auth.dart';
import '../services/firebase_phone_auth/i_firebase_phone_auth.dart';
import '../services/http/http_lib.dart';
import '../services/logger/abs_logger.dart';
import '../services/logger/debug_logger.dart';
import '../services/logger/fake_logger.dart';
import '../services/persistence/cache/abs_cache_service.dart';
import '../services/persistence/cache/fake_cache_service.dart';
import '../services/persistence/cache/local_cache_service.dart';
import '../services/url_launcher/i_url_launcher_service.dart';
import '../services/url_launcher/url_launcher_service.dart';

class InitSetupDI{

  InitSetupDI._();

  static void initServices(){
    // region ==== services ====
    // logger
    if (BUILD_TYPE == BuildType.debug) {
      DI.setSingleton<AbsLogger>(() => DebugLogger()..enableAnsiColors(false));
    } else {
      DI.setSingleton<AbsLogger>(() => FakeLogger());
    }
    // cache service
    DI.setSingleton<AbsCacheService>(() => LocalCacheService());
    // connectivity service
    DI.setSingleton<IConnectivityService>(() => ConnectivityService());
    // http
    DI.setSingleton<IHttpService>(() => DioHttpService());
    // url launcher service
    DI.setSingleton<IUrlLauncherService>(() => UrlLauncherService());
    // firebase phone auth service
    DI.setSingleton<IFirebasePhoneAuth>(() => FirebasePhoneAuth());
    // endregion  ==== services ====
  }

  static void initManagers(AppConfig config){
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
    // app config
    DI.setSingleton(() => config);
    // endregion  ==== managers ====
  }

  static void initDemoMode(AppConfig config){
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
    //
    DI.remove<AppConfig>();
    DI.setSingleton(() => config);
  }
}