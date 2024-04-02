// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:my_alarm/importer.dart';

class AlarmConfigScreen extends StatelessWidget {
  const AlarmConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        child: Text("10:00",
            style: TextStyle(
                fontSize: 50, color: white, fontWeight: FontWeight.w500)),
      )
    ]));
  }
}

void showAlarmConfigScreen(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Container(
          decoration: BoxDecoration(border: Border.all()),
          height: 500,
          width: 500,
          child: Column(
            children: [
              Text("10:00",
                  style: TextStyle(
                      fontSize: 50, color: white, fontWeight: FontWeight.w500)),
            ],
          )));
}
