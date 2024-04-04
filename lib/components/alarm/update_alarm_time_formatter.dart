import 'package:my_alarm/importer.dart';

class UpdateAlarmTimeFormatter extends TextInputFormatter {
  final bool isHour;

  UpdateAlarmTimeFormatter({required this.isHour});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newValueString;
    bool isValidated;

    if (oldValue.text.length > newValue.text.length) {
      if (newValue.text.isEmpty) {
        newValueString = "0";
      } else {
        newValueString = newValue.text;
      }
    } else {
      String inputNum = newValue.text[newValue.selection.baseOffset - 1];

      if (newValue.text.length == 3) {
        newValueString = inputNum;
      } else {
        newValueString = oldValue.text + inputNum;
      }
    }

    if (isHour) {
      isValidated = validateHour(hour: newValueString);
    } else {
      isValidated = validateMin(min: newValueString);
    }

    return TextEditingValue(
      text: isValidated ? newValueString : oldValue.text,
    );
  }
}

bool validateHour({String hour = "0"}) {
  int hourNum = int.parse(hour);
  if (hourNum < 0 || hourNum > 23) return false;
  return true;
}

bool validateMin({String min = "0"}) {
  int minNum = int.parse(min);
  if (minNum < 0 || minNum > 59) return false;
  return true;
}
