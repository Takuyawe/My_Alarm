import 'package:my_alarm/importer.dart';

DateTime parseTime(String timeStr) {
  final now = DateTime.now();
  final timeParts = timeStr.split(":");
  final hour = int.parse(timeParts[0]);
  final min = int.parse(timeParts[1]);
  return DateTime(now.year, now.month, now.day, hour, min);
}

void sortAlarmDataList(List<AlarmData> alarmDataList) {
  alarmDataList.sort((a, b) {
    final timeA = parseTime(a.alarmTime);
    final timeB = parseTime(b.alarmTime);
    return timeA.compareTo(timeB);
  });
}
