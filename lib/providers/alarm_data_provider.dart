import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:my_alarm/importer.dart";

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) {
  return AlarmRepository();
});

final sharedPreferencesInstanceProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final alarmDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final SharedPreferences prefs =
      await ref.read(sharedPreferencesInstanceProvider.future);

  final String? alarmDataJson = prefs.getString("alarmData");

  if (alarmDataJson == null) return {};

  return jsonDecode(alarmDataJson);
});
