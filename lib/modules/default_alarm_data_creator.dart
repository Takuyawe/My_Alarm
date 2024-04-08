import 'package:intl/intl.dart';
import 'package:my_alarm/importer.dart';

AlarmData getDefaultAlarmData() {
  return AlarmData(
      id: const Uuid().v4(),
      alarmTime: DateFormat("HH:mm").format(DateTime.now()),
      repeatedDays: [0, 0, 0, 0, 0, 0, 0],
      label: "Alarm",
      isActive: true);
}
