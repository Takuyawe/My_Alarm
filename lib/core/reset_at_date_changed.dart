import 'package:my_alarm/importer.dart';

void resetAtDateChanged(List<AlarmData> alarmDataList) {
  DateTime now = DateTime.now();
  DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1);
  Duration duration = nextMidnight.difference(now);

  Timer(duration, () {
    print("Daily reset triggered");
    scheduleAlarm(alarmDataList);
    resetAtDateChanged(alarmDataList);
  });
}
