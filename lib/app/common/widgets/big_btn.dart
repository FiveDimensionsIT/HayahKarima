import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class BigBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BtnState state;

  BigBtn({required this.text, required this.onPressed, this.state = BtnState.active});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (state == BtnState.active) {
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed();
          }
        },
        child: state == BtnState.loading ? _getScalingProgressIndicator(context) : Text(text),
        style: state == BtnState.disabled
            ? getDisabledStyle(context)
            : state == BtnState.loading
                ? getLoadingStyle(context)
                : null,
      ),
    );
  }

  ButtonStyle getDisabledStyle(BuildContext context) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Theme.of(context).disabledColor),
      overlayColor: MaterialStateProperty.all(Theme.of(context).disabledColor),
      //foregroundColor: MaterialStateProperty.all(Theme.of(context).shadowColor)
    );
  }

  ButtonStyle getLoadingStyle(BuildContext context) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      //overlayColor: MaterialStateProperty.all(Theme.of(context).buttonColor),
    );
  }

  Widget _getJumbingDotsProgress(BuildContext context) {
    return JumpingDotsProgressIndicator(
      color: Theme.of(context).cardColor,
      fontSize: Theme.of(context).textTheme.headline3!.fontSize!,
      numberOfDots: 5,
      dotSpacing: 5,
    );
  }

  Widget _getScalingProgressIndicator(BuildContext context) {
    return CollectionScaleTransition(
      end: 1.3,
      children: List.filled(5, _scalingItem(context)),
    );
  }

  Widget _scalingItem(BuildContext context) {
    return Container(
      width: 7,
      height: 30,
      color: Theme.of(context).cardColor.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
    );
  }
}

enum BtnState { active, loading, disabled }
