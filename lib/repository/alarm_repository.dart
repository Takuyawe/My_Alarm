import 'package:my_alarm/importer.dart';

class AlarmRepository {
  Future<Map<String, dynamic>> getAlarmData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? alarmDataString = prefs.getString('alarmData');
    if (alarmDataString == null) return {};
    Map<String, dynamic> alarmData = jsonDecode(alarmDataString);
    return alarmData;
  }

  Future<void> saveAlarm(Map<String, dynamic> alarmData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String alarmDataString = jsonEncode(alarmData);
    await prefs.setString('alarmData', alarmDataString);
  }
}
