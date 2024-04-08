// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';

class AlarmCard extends ConsumerWidget {
  final AlarmData alarmData;
  final Function updateAlarmDataList;

  const AlarmCard(
      {super.key, required this.alarmData, required this.updateAlarmDataList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 270,
      width: 270,
      child: GestureDetector(
          onTap: () => {
                showAlarmConfigScreen(context, ref,
                    alarmData: alarmData,
                    updateAlarmDataList: updateAlarmDataList)
              },
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              color: grey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(alarmData.alarmTime,
                            style: TextStyle(
                                fontSize: 55,
                                color: white,
                                fontWeight: FontWeight.w500)),
                        IconButton(
                            iconSize: 30,
                            onPressed: () async {
                              final provider =
                                  ref.watch(alarmRepositoryProvider);
                              final prefs =
                                  await provider.getSharedPreferences();
                              await provider.deleteAlarmData(
                                  alarmData.id, prefs);
                              updateAlarmDataList();
                              final scheduleAlarmProvider =
                                  ref.read(scheduleAlarmRepositoryProvider);
                              final alarmDataList =
                                  await provider.getAlarmData(prefs);
                              scheduleAlarmProvider
                                  .scheduleAlarm(alarmDataList);
                            },
                            icon: Icon(Icons.delete, color: white)),
                      ],
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(alarmData.label,
                                  style: TextStyle(color: white, fontSize: 20)),
                              Text(
                                  "Repeat: ${getRepeatString(alarmData.repeatedDays)}",
                                  style: TextStyle(color: white, fontSize: 16)),
                            ])),
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 50,
                      margin: EdgeInsets.only(left: 20),
                      child: CupertinoSwitch(
                          value: alarmData.isActive,
                          onChanged: (value) async {
                            final provider = ref.watch(alarmRepositoryProvider);
                            final prefs = await provider.getSharedPreferences();
                            await provider.toggleIsActive(alarmData.id, prefs);
                            updateAlarmDataList();

                            final scheduleAlarmProvider =
                                ref.read(scheduleAlarmRepositoryProvider);
                            final alarmDataList =
                                await provider.getAlarmData(prefs);
                            scheduleAlarmProvider.scheduleAlarm(alarmDataList);
                          },
                          thumbColor: white,
                          activeColor: baseDarkColor,
                          trackColor: lightGrey),
                    ),
                  ]))),
    );
  }
}
