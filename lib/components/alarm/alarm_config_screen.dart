// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';

void showAlarmConfigScreen(BuildContext context, WidgetRef ref,
    {required AlarmData alarmData, bool newAlarm = false}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlarmConfigScreen(alarmData: alarmData, newAlarm: newAlarm);
      });
}

class AlarmConfigScreen extends ConsumerStatefulWidget {
  final AlarmData alarmData;
  final bool newAlarm;
  const AlarmConfigScreen(
      {super.key, required this.alarmData, this.newAlarm = false});

  @override
  ConsumerState<AlarmConfigScreen> createState() => _AlarmConfigScreenState();
}

class _AlarmConfigScreenState extends ConsumerState<AlarmConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return (Dialog(
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
                  child: Text(widget.alarmData.alarmTime,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WeekButton(
                                    weekDay: "Sun",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[0] == 1
                                            ? true
                                            : false),
                                WeekButton(
                                    weekDay: "Mon",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[1] == 1
                                            ? true
                                            : false),
                                WeekButton(
                                    weekDay: "Tue",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[2] == 1
                                            ? true
                                            : false),
                              ],
                            )),
                        Gap(7),
                        SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WeekButton(
                                    weekDay: "Wed",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[3] == 1
                                            ? true
                                            : false),
                                WeekButton(
                                    weekDay: "Thu",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[4] == 1
                                            ? true
                                            : false),
                                WeekButton(
                                    weekDay: "Fri",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[5] == 1
                                            ? true
                                            : false),
                                WeekButton(
                                    weekDay: "Sat",
                                    isRepeated:
                                        widget.alarmData.repeatedDays[6] == 1
                                            ? true
                                            : false),
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
                          ref
                              .watch(alarmRepositoryProvider)
                              .saveAlarmData(widget.alarmData);
                        }),
                    Gap(20)
                  ],
                )
              ],
            ))));
  }
}
