import 'package:my_alarm/importer.dart';

class AlarmRepository {
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  String encodeToJson(List<AlarmData> alarmDataList) {
    List<Map<String, dynamic>> alarmDataMapList =
        alarmDataList.map((alarm) => alarm.toJson()).toList();
    return jsonEncode(alarmDataMapList);
  }

  Future<void> saveToSharedPreferences(
      List<AlarmData> alarmDataList, SharedPreferences prefs) async {
    await deleteSharedPreferencesData(prefs);
    String alarmDataJson = encodeToJson(alarmDataList);
    await prefs.setString(sharedPreferencesAlarmDataKey, alarmDataJson);
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

  Future<void> createNewAlarmData(
      AlarmData alarmData, SharedPreferences prefs) async {
    final List<AlarmData> alarmDataList = await getAlarmData(prefs);
    alarmDataList.add(alarmData);
    await saveToSharedPreferences(alarmDataList, prefs);
  }

  Future<void> updateAlarmData(
      AlarmData alarmData, String id, SharedPreferences prefs) async {
    final List<AlarmData> alarmDataList = await getAlarmData(prefs);
    final index = alarmDataList.indexWhere((element) => element.id == id);
    if (index != -1) {
      alarmDataList[index] = alarmData;
    }
    await saveToSharedPreferences(alarmDataList, prefs);
  }

  Future<void> deleteAlarmData(String id, SharedPreferences prefs) async {
    final List<AlarmData> alarmDataList = await getAlarmData(prefs);
    alarmDataList.removeWhere((element) => element.id == id);
    await saveToSharedPreferences(alarmDataList, prefs);
  }

  Future<void> deleteSharedPreferencesData(SharedPreferences prefs) async {
    await prefs.remove(sharedPreferencesAlarmDataKey);
  }
}
