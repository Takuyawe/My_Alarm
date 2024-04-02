import 'package:my_alarm/importer.dart';

class WeekButton extends StatelessWidget {
  const WeekButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            minimumSize: MaterialStateProperty.all(Size(40, 45)),
            backgroundColor: MaterialStateProperty.all(white)),
        child: Text("Sun"));
  }
}
