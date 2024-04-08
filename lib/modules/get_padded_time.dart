String getPaddedTime(String time) {
  List<String> timeParts = time.split(":");
  String hour = int.parse(timeParts[0]).toString().padLeft(2, "0");
  String min = int.parse(timeParts[1]).toString().padLeft(2, "0");
  return "$hour:$min";
}
