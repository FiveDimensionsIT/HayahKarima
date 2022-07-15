import '../app/common/models/enums/running_app.dart';

class AppConfig {
  final String appTitle;
  final String apiURL;
  final RunningApp runningApp;

  const AppConfig({required this.appTitle, required this.apiURL, required this.runningApp});
}
