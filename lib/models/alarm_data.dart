import 'package:my_alarm/importer.dart';

class AlarmData {
  final String id;
  final String alarmTime;
  final String label;
  final bool isActive;
  final List<int> repeatedDays;

  AlarmData({
    required this.id,
    required this.alarmTime,
    required this.label,
    required this.isActive,
    required this.repeatedDays,
  });

  factory AlarmData.fromJson(Map<String, dynamic> json) {
    return AlarmData(
      id: json['id'],
      alarmTime: json['alarmTime'],
      label: json['label'],
      isActive: json['isActive'],
      repeatedDays:
          (json['repeatedDays'] as List).map((e) => e as int).toList(),
    );
  }
}
