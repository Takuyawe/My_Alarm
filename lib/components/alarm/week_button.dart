import 'package:my_alarm/importer.dart';

class WeekButton extends StatelessWidget {
  final String weekDay;
  final bool isRepeated;

  const WeekButton(
      {super.key, required this.weekDay, required this.isRepeated});

  @override
  Widget build(BuildContext context) {
    // TODO: receive params: [weekDay, isRepeated]
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(
                BorderSide(color: isRepeated ? transparent : white, width: 1)),
            fixedSize: MaterialStateProperty.all(const Size(40, 35)),
            // TODO: change color depending on whether it's checked or not
            backgroundColor: isRepeated
                ? MaterialStateProperty.all(white)
                : MaterialStateProperty.all(baseDarkColor)),
        child: Text(weekDay,
            style: TextStyle(
                color: isRepeated ? baseDarkColor : white,
                fontWeight: FontWeight.w300)));
  }
}
