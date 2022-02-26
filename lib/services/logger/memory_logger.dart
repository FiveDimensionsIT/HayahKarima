

import 'logger_lib.dart';

class MemoryLogger extends AbsLogger {
  List<String> _logLines = [];

  MemoryLogger(){
    this.splitLog = false;
  }

  @override
  List<String> getSavedLogs() {
    return _logLines;
  }

  @override
  void clearSavedLogs() {
    _logLines.clear();
  }

  @override
  void writeLogLine(LogLevel? ll, String line) {
    _logLines.add(line);
  }
}
