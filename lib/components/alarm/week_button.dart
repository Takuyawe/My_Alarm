import 'package:my_alarm/importer.dart';

class WeekButton extends StatelessWidget {
  const WeekButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: receive params: [weekDay, isRepeated]
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            minimumSize: MaterialStateProperty.all(Size(40, 45)),
            // TODO: change color depending on whether it's checked or not
            backgroundColor: MaterialStateProperty.all(white)),
        child: Text("Sun",
            style:
                TextStyle(color: baseDarkColor, fontWeight: FontWeight.w300)));
  }
}
