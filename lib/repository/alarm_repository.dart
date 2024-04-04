import 'package:my_alarm/importer.dart';

class AlarmRepository {
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<List<AlarmData>> getAlarmData(SharedPreferences prefs) async {
    String? alarmDataJson = prefs.getString(sharedPreferencesAlarmDataKey);
    if (alarmDataJson == null) return [];
    List<dynamic> jsonList = jsonDecode(alarmDataJson);
    List<AlarmData> alarmDataList = jsonList
        .map((json) => AlarmData.fromJson(json as Map<String, dynamic>))
        .toList();
    return alarmDataList;
  }

  Future<void> saveAlarmData(
      AlarmData alarmData, SharedPreferences prefs) async {
    final List<AlarmData> alarmDataList = await getAlarmData(prefs);
    alarmDataList.add(alarmData);
    List<Map<String, dynamic>> alarmDataMapList =
        alarmDataList.map((alarm) => alarm.toJson()).toList();
    String alarmDataJson = jsonEncode(alarmDataMapList);
    await prefs.setString(sharedPreferencesAlarmDataKey, alarmDataJson);
  }
}
