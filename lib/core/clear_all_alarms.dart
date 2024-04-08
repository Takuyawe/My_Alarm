import 'package:my_alarm/importer.dart';

void clearAllAlarms(List<Timer> timerList) {
  for (var timer in timerList) {
    timer.cancel();
  }
  timerList.clear();
}
