import '../config/app_config.dart';
import '../config/global.dart';
import '../config/main_common.dart';

void main() {
  mainCommon(const AppConfig(appTitle: "نادي القراء", apiURL: Global.readersClubBaseUrlProd));
}
