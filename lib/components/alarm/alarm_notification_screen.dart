// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_alarm/importer.dart';

void showAlarmNotificationScreen(GlobalKey<NavigatorState> navigatorKey,
    {required AlarmData alarmData}) {
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlarmNotificationScreen(alarmData: alarmData));
}

class AlarmNotificationScreen extends StatelessWidget {
  final AlarmData alarmData;

  const AlarmNotificationScreen({super.key, required this.alarmData});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shadowColor: white,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: white),
                color: baseDarkColor,
                borderRadius: BorderRadius.circular(20)),
            height: 400,
            width: 700,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "It's time for",
                      style: TextStyle(
                          fontSize: 40,
                          color: white,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      alarmData.label,
                      style: TextStyle(
                          fontSize: 70,
                          color: white,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 55),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current    ",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              getPaddedTime(alarmData.alarmTime),
                              style: TextStyle(
                                  fontSize: 70,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "   Time",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                    ),
                    Gap(30),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(500, 50)),
                            backgroundColor: MaterialStateProperty.all(white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          "Dismiss",
                          style: TextStyle(
                              fontSize: 30,
                              color: baseDarkColor,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ))));
  }
}
