DateTime parseTime(String timeStr) {
  final now = DateTime.now();
  final timeParts = timeStr.split(":");
  final hour = int.parse(timeParts[0]);
  final min = int.parse(timeParts[1]);
  return DateTime(now.year, now.month, now.day, hour, min);
}
