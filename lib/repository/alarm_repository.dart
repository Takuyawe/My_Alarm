import 'package:my_alarm/importer.dart';
import 'package:my_alarm/models/alarm_data.dart';

class AlarmRepository {
  Future<AlarmData> getAlarmData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? alarmDataJson = prefs.getString('alarmData');
    if (alarmDataJson == null)
      return AlarmData(
          id: const Uuid().v4(),
          alarmTime: "",
          label: "",
          isActive: false,
          repeatedDays: []);
    Map<String, dynamic> json = jsonDecode(alarmDataJson);
    return AlarmData.fromJson(json);
  }

  Future<void> saveAlarm(Map<String, dynamic> alarmData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String alarmDataString = jsonEncode(alarmData);
    await prefs.setString('alarmData', alarmDataString);
  }
}
