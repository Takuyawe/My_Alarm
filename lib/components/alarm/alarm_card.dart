// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';

class AlarmCard extends ConsumerWidget {
  final AlarmData alarmData;

  const AlarmCard({super.key, required this.alarmData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: 270,
        width: 270,
        child: GestureDetector(
            onTap: () =>
                {showAlarmConfigScreen(context, ref, alarmData: alarmData)},
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: grey,
              child: Column(children: [
                ListTile(
                    title: Text(alarmData.alarmTime,
                        style: TextStyle(
                            fontSize: 50,
                            color: white,
                            fontWeight: FontWeight.w500)),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Alarm Message",
                              style: TextStyle(color: white, fontSize: 20)),
                          Text("Repeat: None",
                              style: TextStyle(color: white, fontSize: 20)),
                        ]),
                    trailing: Icon(Icons.delete, color: white)),
                CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                    thumbColor: white,
                    activeColor: baseDarkColor,
                    trackColor: lightGrey),
              ]),
            )));
  }
}
