// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:my_alarm/importer.dart';

// class AlarmConfigScreen extends StatelessWidget {
//   const AlarmConfigScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(children: [
//       Container(
//         child: Text("10:00",
//             style: TextStyle(
//                 fontSize: 50, color: white, fontWeight: FontWeight.w500)),
//       )
//     ]));
//   }
// }

void showAlarmConfigScreen(BuildContext context) {
  showDialog(
      context: context,
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
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white), color: baseDarkColor),
                    child: Text("10:00",
                        style: TextStyle(
                            fontSize: 60,
                            color: white,
                            fontWeight: FontWeight.w500)),
                  ),
                  ListTile(
                      leading: Text("Repeat: ",
                          style: TextStyle(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.w200)),
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
                      ))
                ],
              ))));
}
