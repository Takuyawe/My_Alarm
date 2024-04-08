import 'package:my_alarm/importer.dart';

String getRepeatString(List<int> repeatedDays) {
  switch (repeatedDays) {
    case [0, 0, 0, 0, 0, 0, 0]:
      return "None";
    case [1, 0, 0, 0, 0, 0, 1]:
      return "Weekends";
    case [0, 1, 1, 1, 1, 1, 0]:
      return "Weekdays";
    case [1, 1, 1, 1, 1, 1, 1]:
      return "Everyday";
    default:
      String text = "";
      for (int i = 0; i < repeatedDays.length; i++) {
        if (repeatedDays[i] == 1) {
          if (text == "") {
            text = getWeekDay(i);
          } else {
            text = "$text, ${getWeekDay(i)}";
          }
        }
      }
      return text;
  }
}
