import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayah_karema/app/common/themes/app_dimens.dart';

import 'app_colors.dart';

abstract class AppTheme {


  // region app theme constants

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  static const double _borderRadius = 5;
  static const double _borderRadiusOuter = 10;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  static const double _elevation = 5;

  // endregion

  // region theme constants

  static const double _textSizeXL = 25;
  static const double _textSizeL = 20;
  static const double _textSizeM = 17.5;
  static const double _textSizeS = 15;
  static const double _textSizeXS = 10;

  // endregion

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
      //> app bar
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        centerTitle: true,
      ),
      //> dialog
      dialogTheme: DialogTheme(
        elevation: 5,
        backgroundColor: colors.background,//.withOpacity(.6),
        shape: _roundedRecShapeOuter
      ),

      //> button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(_roundedRecShape),
          backgroundColor: MaterialStateProperty.all(colors.neutral),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
          foregroundColor: MaterialStateProperty.all(colors.text),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: _textSizeS, fontWeight: FontWeight.bold)),
        )
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(_roundedRecShape),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
            foregroundColor: MaterialStateProperty.all(colors.primary),
            side: MaterialStateProperty.all(BorderSide(color: colors.primary, width: 1)),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: _textSizeS,)),
          )
      ),

      //> elevated buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(_elevation),
        shape: MaterialStateProperty.all(_roundedRecShapeOuter),
        backgroundColor: MaterialStateProperty.all(colors.primary),
        overlayColor: MaterialStateProperty.all(colors.primaryLight),
        padding: MaterialStateProperty.all(contentPadding),
        shadowColor: MaterialStateProperty.all(colors.text.withOpacity(0.5)),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: AppDimens.fontSizeLarge, fontWeight: FontWeight.bold)),
      )),

      //> toggle buttons
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: colors.primaryLight,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),

      //> input
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colors.neutral,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: _outlineInputBorder(colors.dimmed.withOpacity(0.8)),
          enabledBorder: _outlineInputBorder(colors.dimmed.withOpacity(0.8)),
          focusedBorder: _outlineInputBorder(colors.primary),
          errorBorder: _outlineInputBorder(colors.error),
          contentPadding: contentPadding,
          hintStyle: TextStyle(color: colors.text.withOpacity(0.6),),
          errorStyle: TextStyle(color: colors.error, fontSize: 12)),

      //> text
      textTheme: GoogleFonts.markaziTextTextTheme(TextTheme(
        headline1: TextStyle(fontSize: _textSizeXL, color: colors.text),
        headline2: TextStyle(fontSize: _textSizeL, color: colors.text),
        headline3: TextStyle(fontSize: _textSizeM, color: colors.text),
        headline4: TextStyle(fontSize: _textSizeS, color: colors.text),
        headline5: TextStyle(fontSize: _textSizeXS, color: colors.text),
        bodyText1: TextStyle(fontSize: _textSizeS, color: colors.text),
        bodyText2: TextStyle(fontSize: _textSizeS, color: colors.text),
        subtitle1: TextStyle(fontSize: _textSizeM, color: colors.text),
        button: TextStyle(color: colors.text),
      )),

      //> card
      cardTheme: CardTheme(
        color: colors.neutral,
        elevation: _elevation,
        margin: const EdgeInsets.all(10),
        shadowColor: colors.text.withOpacity(0.5),
        shape: _roundedRecShape,
      ),
    );
  }

  static OutlinedBorder get _roundedRecShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius));

  static OutlinedBorder get _roundedRecShapeOuter =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadiusOuter));

  static OutlineInputBorder _outlineInputBorder(color){
    return OutlineInputBorder(
        borderRadius:  const BorderRadius.all(Radius.circular(_borderRadius)),
        borderSide: BorderSide(color: color, width: 1,));
  }

  static BoxDecoration bottomNavBarDecoration(){
    return BoxDecoration(
        color: AppColors.current.neutral,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: AppColors.current.dimmed.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, -6))
        ]);
  }

}
