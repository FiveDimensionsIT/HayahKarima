import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../ui_lib.dart';

abstract class OverlayHelper {

  OverlayHelper._();

  static Map<int, OverlayEntry?> _lastOverlays = {};

  // TODO: refactor to use the theme colors
  static Color successColor = Color.fromRGBO(46, 204, 113, 1);
  static Color errorColor = Color.fromRGBO(231, 76, 60, 1);
  static Color infoColor = Color.fromRGBO(17, 110, 183, 1);
  static Color warningColor = Color.fromRGBO(241, 196, 15, 1);

  static int _toastLayerIndex = 2, _progressLayerIndex = 1;

  static void showOverlay({int? durationInSeconds, int layerIndex = 0, required Widget widget}) {
    var _overlay = OverlayEntry(builder: (_) => widget);

    if (_lastOverlays[layerIndex] != null) {
      _lastOverlays[layerIndex]!.remove();
      _lastOverlays[layerIndex] = null;
    }
    var o = Overlay.of(Get.overlayContext!);
    if (o == null) {
      return;
    }
    o.insert(_overlay);
    _lastOverlays[layerIndex] = _overlay;

    if (durationInSeconds == null) return;

    Future.delayed(Duration(seconds: durationInSeconds), () {
      if (_lastOverlays[layerIndex] == null || _lastOverlays[layerIndex] != _overlay) return;
      _lastOverlays[layerIndex]!.remove();
      _lastOverlays[layerIndex] = null;
    });
  }

  static void hideOverlay([int layerIndex = 0]) {
    if (_lastOverlays[layerIndex] != null) {
      _lastOverlays[layerIndex]!.remove();
      _lastOverlays[layerIndex] = null;
    }
  }

  static void hideAllOverlays() {
    for (int index in _lastOverlays.keys) {
      hideOverlay(index);
    }
  }

  // toast methods

  static void showToast(String text, Color color, IconData icon, int durationInSeconds) {
    showOverlay(
        durationInSeconds: durationInSeconds, layerIndex: _toastLayerIndex, widget: OverlayToast(text, color, icon));
  }

  static void showSuccessToast(String text, {int seconds = 3}) {
    showToast(text, successColor, Icons.check_circle, seconds);
  }

  static void showErrorToast( String text, {int seconds = 3}) {
    showToast(text, errorColor, Icons.cancel, seconds);
  }

  static void showInfoToast( String text, {int seconds = 3}) {
    showToast(text, infoColor, Icons.info, seconds);
  }

  static void showWarningToast(String text, {int seconds = 3}) {
    showToast(text, warningColor, Icons.warning_rounded, seconds);
  }

  // progress methods
  // layer index 1 is preserved for the progress indicator

  static void showProgressOverlay({required String text, durationInSeconds = 65}) {
    clearFocus(Get.context!);
    showOverlay(layerIndex: _progressLayerIndex, durationInSeconds: durationInSeconds, widget: OverlayProgress(text));
  }

  static void hideProgressOverlay() {
    hideOverlay(_progressLayerIndex);
  }

  static void clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

// region Overlay Toast

class OverlayToast extends StatelessWidget {
  final String text;
  final Color color;
  final IconData iconData;

  OverlayToast(this.text, this.color, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: FullCol(
        heights: "1* auto",
        children: <Widget>[
          Empty(),
          Material(
            elevation: 2,
            color: Colors.white,
            type: MaterialType.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide.none,
            ),
            child: FullRow(
              widths: "auto 1*",
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    iconData,
                    color: color,
                    size: 35,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(text,
                        textAlign: TextAlign.start, style: TextStyle(color: color, fontSize: 16)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// endregion

// region Progress Overlay

class OverlayProgress extends StatelessWidget {
  final String text;

  OverlayProgress(this.text);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        Center(
          child: Material(
            elevation: 2,
            color: Colors.white,
            type: MaterialType.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side: BorderSide.none,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// endregion
