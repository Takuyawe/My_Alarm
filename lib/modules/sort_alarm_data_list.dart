import 'package:my_alarm/importer.dart';

void sortAlarmDataList(List<AlarmData> alarmDataList) {
  alarmDataList.sort((a, b) {
    final timeA = parseTime(a.alarmTime);
    final timeB = parseTime(b.alarmTime);
    return timeA.compareTo(timeB);
  });
}
