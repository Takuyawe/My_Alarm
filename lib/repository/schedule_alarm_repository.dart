import 'package:my_alarm/components/alarm/alarm_notification_screen.dart';

import '../importer.dart';

class ScheduleAlarmRepository {
  List<Timer> timerList = [];

  void scheduleAlarm(
      GlobalKey<NavigatorState> navigatorKey, List<AlarmData> alarmDataList) {
    clearAllAlarms();
    for (var alarmData in alarmDataList) {
      if (alarmData.isActive == false) continue;
      DateTime now = DateTime.now();
      int weekDay = now.weekday - 1;
      if (getRepeatString(alarmData.repeatedDays) != "None" &&
          alarmData.repeatedDays[weekDay] == 0) continue;
      DateTime alarmDateTime = parseTime(alarmData.alarmTime);
      if (alarmDateTime.isBefore(now)) continue;
      Duration duration = alarmDateTime.difference(now);
      Timer timer = Timer(duration, () {
        showAlarmNotificationScreen(navigatorKey, alarmData: alarmData);
        SwiftPlatformService.bringAppToFront();
      });
      timerList.add(timer);
    }
  }

  void resetAtDateChanged(
      GlobalKey<NavigatorState> navigatorKey, List<AlarmData> alarmDataList) {
    DateTime now = DateTime.now();
    DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1);
    Duration duration = nextMidnight.difference(now);

    Timer(duration, () {
      scheduleAlarm(navigatorKey, alarmDataList);
      resetAtDateChanged(navigatorKey, alarmDataList);
    });
  }

  void clearAllAlarms() {
    for (var timer in timerList) {
      timer.cancel();
    }
    timerList.clear();
  }
}
