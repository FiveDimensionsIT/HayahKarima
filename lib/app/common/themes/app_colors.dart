import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/models/enums/running_app.dart';
import 'package:hayah_karema/config/app_config.dart';
import 'package:hayah_karema/config/setup.dart';

class AppColors {
  static AppColors? _current;

  static AppColors get current {
    if (_current == null) {
      return DI.find<AppConfig>().runningApp == RunningApp.HayahKarima ? _hayahKarimaColors : _readersClubColors;
    }
    return _current!;
  }

  static set current(value) => _current = value;

  AppColors({
    required this.primary,
    required this.secondary,
    required this.primaryLight,
    required this.text,
    required this.text1,
    required this.dimmed,
    required this.dimmedX,
    required this.dimmedXX,
    required this.dimmedLight,
    required this.accent,
    required this.accentLight,
    required this.error,
    required this.background,
    required this.neutral,
    required this.success,
    required this.transparent,
    required this.blue,
  });

  Color primary;
  Color secondary;
  Color primaryLight;
  Color accent;
  Color accentLight;
  Color error;
  Color text;
  Color text1;
  Color neutral;
  Color background;
  Color dimmed;
  Color dimmedX;
  Color dimmedXX;
  Color dimmedLight;
  Color success;
  Color transparent;
  Color blue;
}

final _readersClubColors = AppColors(
    background: const Color.fromRGBO(245, 246, 240, 1),
    secondary: const Color(0xffCB7FE6),
    accent: const Color(0xffF47321),
    accentLight: const Color(0xfff79355),
    error: const Color(0xffe62e00),
    text: const Color.fromRGBO(37, 47, 61, 1),
    text1: const Color(0xFF363535),
    primaryLight: const Color(0xfff57a75),
    primary: const Color(0xfffb1309),
    dimmedLight: const Color.fromRGBO(238, 238, 238, 1.0),
    dimmed: const Color.fromRGBO(167, 167, 167, 1),
    dimmedX: Colors.grey.shade600,
    dimmedXX: Colors.grey.shade800,
    success: const Color.fromRGBO(0, 128, 0, 1),
    neutral: Colors.white,
    blue: Colors.lightBlue.shade700,
    transparent: Colors.transparent);

final _hayahKarimaColors = AppColors(
    background: const Color.fromRGBO(245, 246, 240, 1),
    secondary: const Color(0xffCB7FE6),
    accent: const Color(0xffF47321),
    accentLight: const Color(0xfff79355),
    error: const Color(0xffe62e00),
    text: const Color.fromRGBO(37, 47, 61, 1),
    text1: const Color(0xFF363535),
    primaryLight: const Color(0xff2ad5c4),
    primary: const Color(0xff22A99B),
    dimmedLight: const Color.fromRGBO(238, 238, 238, 1.0),
    dimmed: const Color.fromRGBO(167, 167, 167, 1),
    dimmedX: Colors.grey.shade600,
    dimmedXX: Colors.grey.shade800,
    success: const Color.fromRGBO(0, 128, 0, 1),
    neutral: Colors.white,
    blue: Colors.lightBlue.shade700,
    transparent: Colors.transparent);
