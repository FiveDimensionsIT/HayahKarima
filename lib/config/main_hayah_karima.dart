import '../app/common/models/enums/running_app.dart';
import '../config/app_config.dart';
import '../config/global.dart';
import '../config/main_common.dart';

void main() {
  mainCommon(const AppConfig(
      appTitle: "حياة كريمة الرقمية", apiURL: Global.hayahKarimaBaseUrlProd, runningApp: RunningApp.HayahKarima));
}
