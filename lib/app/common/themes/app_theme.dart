import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  static ThemeData get defaultTheme => fromColors(AppColors.current);

  static fromColors(AppColors colors, {bool isDark = false}) {
    return (isDark ? ThemeData.dark() : ThemeData.light()).copyWith(
      // colors
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      cardColor: colors.neutral,
      disabledColor: colors.dimmed,
      hintColor: colors.dimmed,
      errorColor: colors.error,
      backgroundColor: colors.background,
      accentColor: colors.accent,
      shadowColor: colors.text.withOpacity(0.05),
      buttonColor: colors.accent,
      highlightColor: colors.primaryLight,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        centerTitle: true,
      ),
      dialogTheme: DialogTheme(
          elevation: 5,
          backgroundColor: colors.background, //.withOpacity(.6),
          shape: _roundedRecShapeOuter),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all(_roundedRecShape),
        backgroundColor: MaterialStateProperty.all(colors.neutral),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
        foregroundColor: MaterialStateProperty.all(colors.text),
        textStyle:
            MaterialStateProperty.all(TextStyle(fontSize: AppDimens.fontSizeMedium, fontWeight: FontWeight.bold)),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all(_roundedRecShape),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
        foregroundColor: MaterialStateProperty.all(colors.primary),
        side: MaterialStateProperty.all(BorderSide(color: colors.primary, width: 1)),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: AppDimens.fontSizeMedium,
        )),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(AppDimens.elevation),
        shape: MaterialStateProperty.all(_roundedRecShapeOuter),
        backgroundColor: MaterialStateProperty.all(colors.primary),
        overlayColor: MaterialStateProperty.all(colors.primaryLight),
        padding: MaterialStateProperty.all(AppDimens.contentPadding),
        shadowColor: MaterialStateProperty.all(colors.text.withOpacity(0.5)),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: AppDimens.fontSizeLarge, fontWeight: FontWeight.bold)),
      )),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: colors.primaryLight,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colors.neutral,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: _outlineInputBorder(colors.dimmed.withOpacity(0.8)),
          enabledBorder: _outlineInputBorder(colors.dimmed.withOpacity(0.8)),
          focusedBorder: _outlineInputBorder(colors.primary),
          errorBorder: _outlineInputBorder(colors.error),
          contentPadding: AppDimens.contentPadding,
          hintStyle: TextStyle(
            color: colors.text.withOpacity(0.6),
          ),
          errorStyle: TextStyle(color: colors.error, fontSize: 12)),
      textTheme: GoogleFonts.markaziTextTextTheme(TextTheme(
        headline1: TextStyle(fontSize: AppDimens.fontSizeLargeXX, color: colors.text),
        headline2: TextStyle(fontSize: AppDimens.fontSizeLarge, color: colors.text),
        headline3: TextStyle(fontSize: AppDimens.fontSizeMediumX, color: colors.text),
        headline4: TextStyle(fontSize: AppDimens.fontSizeMedium, color: colors.text),
        headline5: TextStyle(fontSize: AppDimens.fontSizeSmallX, color: colors.text),
        bodyText1: TextStyle(fontSize: AppDimens.fontSizeMedium, color: colors.text),
        bodyText2: TextStyle(fontSize: AppDimens.fontSizeMedium, color: colors.text),
        subtitle1: TextStyle(fontSize: AppDimens.fontSizeMediumX, color: colors.text),
        button: TextStyle(color: colors.text),
      )),
      cardTheme: CardTheme(
        color: colors.neutral,
        elevation: AppDimens.elevation,
        margin: const EdgeInsets.all(10),
        shadowColor: colors.text.withOpacity(0.5),
        shape: _roundedRecShape,
      ),
    );
  }

  static OutlinedBorder get _roundedRecShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.borderRadius));

  static OutlinedBorder get _roundedRecShapeOuter =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.borderRadiusOuter));

  static OutlineInputBorder _outlineInputBorder(color) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppDimens.borderRadius)),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ));
  }

  static BoxDecoration bottomNavBarDecoration() {
    return BoxDecoration(
        color: AppColors.current.neutral,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: AppColors.current.dimmed.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, -6))
        ]);
  }
}
