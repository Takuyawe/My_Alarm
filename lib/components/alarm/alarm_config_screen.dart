// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_alarm/importer.dart';
import 'package:my_alarm/providers/alarm_data_provider.dart';

void showAlarmConfigScreen(BuildContext context, WidgetRef ref) {
  // TODO: receive alarm data here, if not set, add a new alarm
  // TODO: receive a parameter "newAlarm" to determine whether it's a new alarm or not
  final newAlarm = true;
  String id = Uuid().v4();
  String alarmTime = DateFormat("HH:mm").format(DateTime.now());
  List<int> repeatedDays = [0, 0, 0, 0, 0, 0, 0];
  String label = "Default";
  bool isActive = false;

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
          shadowColor: white,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  color: baseDarkColor,
                  borderRadius: BorderRadius.circular(20)),
              height: 400,
              width: 400,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(color: white),
                        color: baseDarkColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text("10:00",
                        style: TextStyle(
                            fontSize: 60,
                            color: white,
                            fontWeight: FontWeight.w500)),
                  ),
                  ListTile(
                      leading: Text("Repeat: ",
                          style: TextStyle(
                              fontSize: 25,
                              color: white,
                              fontWeight: FontWeight.w400)),
                      title: Column(
                        children: [
                          SizedBox(
                              width: 180,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  WeekButton(),
                                  WeekButton(),
                                  WeekButton(),
                                ],
                              )),
                          Gap(7),
                          SizedBox(
                              width: 250,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  WeekButton(),
                                  WeekButton(),
                                  WeekButton(),
                                  WeekButton(),
                                ],
                              )),
                        ],
                      )),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Label: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.w300)),
                      Gap(10),
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: TextFormField(
                            maxLines: 1,
                            controller:
                                TextEditingController(text: "Initial value"),
                            style: TextStyle(color: white),
                            decoration: InputDecoration(
                              labelText: "Label",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                      )
                    ],
                  ),
                  Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(100, 30)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {
                            // TODO: if changed, ask for confirmation
                            Navigator.pop(context);
                          }),
                      Gap(10),
                      OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(white),
                            fixedSize: MaterialStateProperty.all(Size(100, 30)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          child: Text("Save",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: baseDarkColor,
                                  fontWeight: FontWeight.w500)),
                          onPressed: () async {
                            AlarmData alarmData = AlarmData(
                                id: id,
                                alarmTime: alarmTime,
                                label: label,
                                isActive: isActive,
                                repeatedDays: repeatedDays);
                            ref
                                .watch(alarmRepositoryProvider)
                                .saveAlarmData(alarmData);
                          }),
                      Gap(20)
                    ],
                  )
                ],
              ))));
}
