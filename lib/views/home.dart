import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';
import 'package:my_alarm/providers/alarm_data_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  AlarmData? alarmData;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    alarmData = await ref.read(alarmRepositoryProvider).getAlarmData();
    print(alarmData!.alarmTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseDarkColor,
      appBar: AppBar(title: const Text("Alarm App")),
      body: Container(
          child: Row(
        children: [
          AlarmCard(alarmData: alarmData),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightBlue,
        child: const Icon(Icons.add),
        onPressed: () {
          showAlarmConfigScreen(context, ref);
        },
      ),
    );
  }
}
