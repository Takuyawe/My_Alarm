import 'package:my_alarm/importer.dart';

void scheduleAlarm(List<AlarmData> alarmDataList) {
  // clearAllAlarms(timerList);
  for (var alarmData in alarmDataList) {
    if (alarmData.isActive == false) continue;
    DateTime now = DateTime.now();
    int weekDay = now.weekday - 1;
    if (getRepeatString(alarmData.repeatedDays) != "None" &&
        alarmData.repeatedDays[weekDay] == 0) continue;
    DateTime alarmDateTime = parseTime(alarmData.alarmTime);
    if (alarmDateTime.isBefore(now)) continue;
    Duration duration = alarmDateTime.difference(now);
    Timer(duration, () {
      SwiftPlatformService.bringAppToFront();
    });
  }
}
