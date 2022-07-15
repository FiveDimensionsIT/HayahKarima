import 'package:hayah_karema/app/common/models/enums/running_app.dart';

import '../config/app_config.dart';
import '../config/global.dart';
import '../config/main_common.dart';

void main() {
  mainCommon(const AppConfig(appTitle: "نادي القراء", apiURL: Global.readersClubBaseUrlProd, runningApp: RunningApp.ReadersClub));
}
