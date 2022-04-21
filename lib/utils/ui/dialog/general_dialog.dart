import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:hayah_karema/utils/ui/dialog/dialog_helper.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';
import '../empty.dart';

class GeneralDialog extends StatelessWidget {
  String? title, subTitle;
  Widget? icon;
  //
  String yesAction;
  String? noAction, cancelAction;
  Color? yesColor, noColor, cancelColor;

  GeneralDialog(
      {this.title,
      this.subTitle,
      this.icon,
      required this.yesAction,
      this.noAction,
      this.cancelAction,
      this.yesColor,
      this.noColor,
      this.cancelColor});

  bool get _titleExists => title != null && title!.isNotEmpty;

  bool get _subTitleExists => subTitle != null && subTitle!.isNotEmpty;

  static double _smallPadding = 2;
  static double _normalPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          //_buildBackdrop(context),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _normalPadding - 5, horizontal: _normalPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: icon != null, child: Container(margin: const EdgeInsets.all(20), child: icon ?? Container())),
                Visibility(
                    visible: icon != null,
                    child: Empty(
                      height: _normalPadding,
                    )),
                //
                Visibility(
                    visible: _titleExists,
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.bold),
                    )),
                Visibility(
                    visible: _titleExists,
                    child: Empty(
                      height: _normalPadding,
                    )),
                //
                Visibility(
                    visible: _subTitleExists,
                    child: Text(
                      subTitle ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    )),
                Visibility(
                    visible: _subTitleExists,
                    child: Empty(
                      height: _normalPadding,
                    )),
                //
                (noAction == null && cancelAction == null)
                    ?
                    // info dialog
                    _buildYesBtn(context)
                    : (noAction != null && cancelAction != null)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildYesBtn(context),
                              Empty(
                                height: _smallPadding,
                              ),
                              _buildNoBtn(context),
                              Empty(
                                height: _normalPadding,
                              ),
                              _buildCancelBtn(context)
                            ],
                          )
                        : (noAction != null)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildYesBtn(context),
                                  Empty(
                                    height: _smallPadding,
                                  ),
                                  _buildNoBtn(context),
                                ],
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildYesBtn(context),
                                  Empty(
                                    height: _smallPadding,
                                  ),
                                  _buildCancelBtn(context)
                                ],
                              )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYesBtn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(yesColor ?? OverlayHelper.successColor)),
        child: Text(
          yesAction,
          style: TextStyle(
              color: AppColors.current.neutral,
              fontSize: Theme.of(context).textTheme.headline3?.fontSize),
        ),
        onPressed: () => _returnWith(true),
      ),
    );
  }

  Widget _buildNoBtn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(noColor ?? OverlayHelper.infoColor)),
        child: Text(noAction!, style: TextStyle(
            color: AppColors.current.neutral,
            fontSize: Theme.of(context).textTheme.headline3?.fontSize)),
        onPressed: () => _returnWith(false),
      ),
    );
  }

  Widget _buildCancelBtn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(cancelColor ?? OverlayHelper.infoColor),
            side: MaterialStateProperty.all(BorderSide(color: cancelColor ?? OverlayHelper.infoColor))),
        child: Text(cancelAction!, style: TextStyle(fontSize: Theme.of(context).textTheme.headline3?.fontSize)),
        onPressed: () => _returnWith(null),
      ),
    );
  }

  void _returnWith(bool? result) {
    DialogHelper.hideDialog(result);
  }

  Widget _buildBackdrop(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Theme.of(context).backgroundColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
