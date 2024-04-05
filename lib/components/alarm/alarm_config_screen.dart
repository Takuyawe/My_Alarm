// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/components/alarm/update_alarm_time_formatter.dart';
import 'package:my_alarm/importer.dart';

void showAlarmConfigScreen(BuildContext context, WidgetRef ref,
    {required AlarmData alarmData,
    bool newAlarm = false,
    required Function updateFunc}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlarmConfigScreen(
            alarmData: alarmData, newAlarm: newAlarm, updateFunc: updateFunc);
      });
}

class AlarmConfigScreen extends ConsumerStatefulWidget {
  final AlarmData alarmData;
  final bool newAlarm;
  final Function updateFunc;
  const AlarmConfigScreen(
      {super.key,
      required this.alarmData,
      this.newAlarm = false,
      required this.updateFunc});

  @override
  ConsumerState<AlarmConfigScreen> createState() => _AlarmConfigScreenState();
}

class _AlarmConfigScreenState extends ConsumerState<AlarmConfigScreen> {
  int _alarmTimeFocused = 0;

  List<String> getTimeList(String time) {
    List<String> timeParts = time.split(":");
    String hour = int.parse(timeParts[0]).toString().padLeft(2, "0");
    String min = int.parse(timeParts[1]).toString().padLeft(2, "0");
    return [hour, min];
  }

  String convertToTimeFromTimeList(List<String> timeList) {
    String hour = timeList[0];
    String min = timeList[1];
    return "$hour:$min";
  }

  void handleChangeTextField(int index, String value, List<String> alarmTime) {
    alarmTime[index] = value;
  }

  @override
  Widget build(BuildContext context) {
    String _id = widget.alarmData.id;
    List<String> _alarmTime = getTimeList(widget.alarmData.alarmTime);
    String _label = widget.alarmData.label;
    List<int> _repeatedDays = widget.alarmData.repeatedDays;

    void handleChangeAlarmTimeFocused(int index) {
      if (_alarmTimeFocused == index) return;
      setState(() {
        _alarmTimeFocused = _alarmTimeFocused == 0 ? 1 : 0;
      });
    }

    void handleChangeLabel(String value) {
      setState(() {
        _label = value;
      });
    }

    void handleToggleButton(int index) {
      setState(() {
        _repeatedDays[index] = _repeatedDays[index] == 0 ? 1 : 0;
      });
    }

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
                    width: 200,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(color: white),
                        color: baseDarkColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 80,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            color: _alarmTimeFocused == 0
                                ? lightBlue
                                : baseDarkColor,
                            child: TextFormField(
                                initialValue: _alarmTime[0],
                                onTap: () => handleChangeAlarmTimeFocused(0),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  UpdateAlarmTimeFormatter(isHour: true)
                                ],
                                onChanged: (value) => (handleChangeTextField(
                                    0, value, _alarmTime)),
                                showCursor: false,
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 60,
                                    color: white,
                                    fontWeight: FontWeight.w500))),
                        Text(":",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 60,
                                color: white,
                                fontWeight: FontWeight.w500)),
                        Container(
                            alignment: Alignment.center,
                            width: 80,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            color: _alarmTimeFocused == 1
                                ? lightBlue
                                : baseDarkColor,
                            child: TextFormField(
                                initialValue: _alarmTime[1],
                                onTap: () => handleChangeAlarmTimeFocused(1),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  UpdateAlarmTimeFormatter(isHour: false)
                                ],
                                onChanged: (value) => (handleChangeTextField(
                                    1, value, _alarmTime)),
                                showCursor: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    height: 1.2,
                                    fontSize: 60,
                                    color: white,
                                    fontWeight: FontWeight.w500))),
                      ],
                    )),
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
                                    weekDayNum: 0,
                                    isRepeated:
                                        _repeatedDays[0] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                                WeekButton(
                                    weekDayNum: 1,
                                    isRepeated:
                                        _repeatedDays[1] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                                WeekButton(
                                    weekDayNum: 2,
                                    isRepeated:
                                        _repeatedDays[2] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                              ],
                            )),
                        Gap(7),
                        SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WeekButton(
                                    weekDayNum: 3,
                                    isRepeated:
                                        _repeatedDays[3] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                                WeekButton(
                                    weekDayNum: 4,
                                    isRepeated:
                                        _repeatedDays[4] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                                WeekButton(
                                    weekDayNum: 5,
                                    isRepeated:
                                        _repeatedDays[5] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
                                WeekButton(
                                    weekDayNum: 6,
                                    isRepeated:
                                        _repeatedDays[6] == 1 ? true : false,
                                    onToggleButton: handleToggleButton),
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
                          initialValue: _label,
                          onChanged: handleChangeLabel,
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
                          final provider = ref.watch(alarmRepositoryProvider);
                          final prefs = await provider.getSharedPreferences();
                          final AlarmData customizedAlarmData = AlarmData(
                              id: _id,
                              alarmTime: convertToTimeFromTimeList(_alarmTime),
                              label: _label,
                              isActive: true,
                              repeatedDays: _repeatedDays);
                          if (widget.newAlarm) {
                            await provider.createNewAlarmData(
                                customizedAlarmData, prefs);
                          } else {
                            await provider.updateAlarmData(
                                customizedAlarmData, _id, prefs);
                          }
                          widget.updateFunc();
                          if (mounted) {
                            Navigator.pop(context);
                          }
                        }),
                    Gap(20)
                  ],
                )
              ],
            ))));
  }
}
