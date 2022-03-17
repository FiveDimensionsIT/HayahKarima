import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {

  static AppColors? _current;
  static AppColors get current => _current ?? _defaultLightColors;
  static set current(value) => _current = value;

  AppColors(
      {required this.primary,
      required this.secondary,
      required this.primaryLight,
      required this.text,
      required this.dimmed,
      required this.dimmedLight,
      required this.accent,
      required this.accentLight,
      required this.error,
      required this.background,
      required this.neutral,
      required this.success,
      required this.transparent,
      });

  Color primary;

  Color secondary;

  Color primaryLight;

  Color accent;

  Color accentLight;

  Color error;

  Color text;

  Color neutral;

  Color background;

  Color dimmed;

  Color dimmedLight;

  Color success;

  Color transparent;


}

var _defaultLightColors = AppColors(
  background: const Color.fromRGBO(245, 246, 240, 1),
  secondary:const Color(0xffCB7FE6),
  accent: const Color(0xffF47321),
  accentLight: const Color(0xfff79355),
  error: const Color(0xffe62e00),
  text: const Color.fromRGBO(37, 47, 61, 1),
  primaryLight: const Color(0xff2ad5c4),
  primary: const Color(0xff22A99B),
  dimmedLight: const Color.fromRGBO(238, 238, 238, 1.0),
  dimmed: const Color.fromRGBO(167, 167, 167, 1),
  success: const Color.fromRGBO(0, 128, 0, 1),
  neutral: Colors.white,
  transparent: Colors.transparent
);
