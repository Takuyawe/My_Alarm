import 'package:my_alarm/importer.dart';

class AlarmRepository {
  Future<List<AlarmData>> getAlarmData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? alarmDataJson = prefs.getString(sharedPreferencesAlarmDataKey);
    if (alarmDataJson == null) return [];
    List<dynamic> jsonList = jsonDecode(alarmDataJson);
    List<AlarmData> alarmDataList = jsonList
        .map((json) => AlarmData.fromJson(json as Map<String, dynamic>))
        .toList();
    return alarmDataList;
  }

  Future<void> saveAlarmData(AlarmData alarmData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<AlarmData> alarmDataList = await getAlarmData();
    alarmDataList.add(alarmData);
    List<Map<String, dynamic>> alarmDataMapList =
        alarmDataList.map((alarm) => alarm.toJson()).toList();
    String alarmDataJson = jsonEncode(alarmDataMapList);
    await prefs.setString(sharedPreferencesAlarmDataKey, alarmDataJson);
  }
}
