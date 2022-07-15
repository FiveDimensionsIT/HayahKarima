

import 'package:hayah_karema/config/setup.dart';
import 'package:hayah_karema/services/logger/abs_logger.dart';

/// a static wrapper to use the logger, mainly to make the logger implementation change
/// (from the debug page) effective
abstract class Log {

  Log._();

  static AbsLogger get _logger => DI.find<AbsLogger>();

  static void error(String key, [Object? value, String? tag]) {
    _logger.error(key, value, tag);
  }

  static void verbose(String key, [Object? value, String? tag]) {
    _logger.verbose(key, value, tag);
  }

  static void debug(String key, [Object? value, String? tag]) {
    _logger.debug(key, value, tag);
  }

  static void info(String key, [Object? value, String? tag]) {
    _logger.info(key, value, tag);
  }

  static void warning(String key, [Object? value, String? tag]) {
    _logger.warning(key, value, tag);
  }
}
