import 'package:get/get.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/services/connectivity/connectivity_lib.dart';
import 'package:hayah_karema/services/http/http_classes.dart';
import 'package:hayah_karema/services/logger/log.dart';
import 'package:hayah_karema/setup.dart';
import 'package:hayah_karema/utils/ui/dialog/overlay_helper.dart';
import 'app_exception.dart';

class ActionCenter {

  final _connectivityService = DI.find<IConnectivityService>();

  static bool displayErrorDetails = false;

  ActionCenter();

  /// returns true if the action is completed successfully,
  /// [errorHandler] takes the exception or error, and is used to
  /// pre-handle it, returns true if the error handled and false
  /// if the error not handled by it, and hence it will fall to
  /// the generic handling
  Future<bool> execute(Future<void> Function() action,
      {bool checkConnection = false, bool Function(Object)? errorHandler}) async {
    try {
      // if check connection
      if (checkConnection) {
        if (!await _connectivityService.isConnected()) {
          Log.info('ActionCenter', 'No Internet Connection');
          OverlayHelper.showErrorToast(AppText.noInternet);
          return false;
        }
      }

      await action();

      return true;
    } catch (ex, st) {
      // the handler sent by the caller
      if (errorHandler != null && errorHandler(ex)) {
        Log.error('error', ex);
        return false;
      }
      //
      if (ex is AppException) {
        Log.error(ex.message, ex.description);
        Log.error('original exception', ex.originalException);
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      } else if (ex is ApiTimeoutException) {
        Log.error('Timeout');
        Log.error('original exception', ex.originalException);
        OverlayHelper.showErrorToast(AppText.requestTimeout);
      } else if (ex is ApiResponseException) {
        Log.error('${ex.statusCode} : ${ex.message}', ex.description);
        Log.error('original exception', ex.originalException);
        OverlayHelper.showErrorToast(AppText.somethingWrongTryAgain);
      } else {
        Log.error('exception', ex);
        OverlayHelper.showErrorToast(AppText.somethingWrong);
      }
      Log.debug('stack trace', st);
      //
      // show the error for testers if configured from the debug page

      if (displayErrorDetails) {
        Get.defaultDialog(
            title: 'Error',
            middleText: ex.toString(),
            // content: SingleChildScrollView(
            //   child: Text(
            //     st.toString(),
            //     maxLines: 100,
            //   ),
            // )
        );
      }
      //
      return false;
    } finally {}
  }
}
