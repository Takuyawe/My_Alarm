import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:my_alarm/importer.dart";

final alarmDataListProvider = FutureProvider<List<AlarmData>>((ref) async {
  final AlarmRepository alarmRepository = ref.read(alarmRepositoryProvider);
  final SharedPreferences prefs = await alarmRepository.getSharedPreferences();
  return alarmRepository.getAlarmData(prefs);
});

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) {
  return AlarmRepository();
});
// final alarmDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
//   final SharedPreferences prefs =
//       await ref.read(sharedPreferencesInstanceProvider.future);

//   final String? alarmDataJson = prefs.getString("alarmData");

//   if (alarmDataJson == null) return {};

//   return jsonDecode(alarmDataJson);
// });
