import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

import 'general_dialog.dart';

abstract class DialogHelper {
  DialogHelper._();

  static Future<bool> showAlertDialog(
      {required AlertType alertType, String? title, String? subTitle, required String okText, Color? okColor}) async {
    return await showCustomDialog(GeneralDialog(
      title: title,
      subTitle: subTitle,
      yesAction: okText,
      yesColor: okColor,
      icon: Icon(
        alertType == AlertType.success
            ? Icons.check_circle
            : alertType == AlertType.info
                ? Icons.info_rounded
                : alertType == AlertType.warning
                    ? Icons.warning_rounded
                    : Icons.error,
        size: 70,
        color: alertType == AlertType.success
            ? OverlayHelper.successColor
            : alertType == AlertType.info
                ? OverlayHelper.infoColor
                : alertType == AlertType.warning
                    ? OverlayHelper.warningColor
                    : OverlayHelper.errorColor,
      ),
    ));
  }

  static Future<bool?> showActionDialog(
      {String? title,
      String? subTitle,
      required String yesText,
      Color? yesColor,
      String? cancelText,
      Color? cancelColor,
      String? noText,
      Color? noColor,
      IconData? icon,
      Color? iconColor}) {
    return showCustomDialog<bool?>(GeneralDialog(
      title: title,
      subTitle: subTitle,
      yesAction: yesText,
      yesColor: yesColor,
      noAction: noText,
      noColor: noColor,
      cancelAction: cancelText,
      cancelColor: cancelColor,
      icon: icon == null
          ? null
          : Icon(
              icon,
              size: 70,
              color: iconColor,
            ),
    ));
  }

  static Future<T?> showCustomDialog<T>(Widget dialogView) {
    return Get.dialog<T>(dialogView, barrierDismissible: false);
  }

  /// used to hide the last shown dialog
  static void hideDialog<T>([T? result]) {
    Get.back(result: result);
  }
}

enum AlertType { success, info, warning, error }
