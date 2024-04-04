import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_alarm/importer.dart';
import 'package:my_alarm/providers/alarm_data_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late List<AlarmData> alarmDataList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final provider = ref.read(alarmRepositoryProvider);
    final prefs = await provider.getSharedPreferences();
    alarmDataList = await provider.getAlarmData(prefs);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
          backgroundColor: baseDarkColor,
          appBar: AppBar(title: const Text("Alarm App")),
          body: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: baseDarkColor,
      appBar: AppBar(title: const Text("Alarm App")),
      body: Container(
          child: Row(
              children: alarmDataList
                  .map((alarmData) => AlarmCard(alarmData: alarmData))
                  .toList())),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightBlue,
        child: const Icon(Icons.add),
        onPressed: () {
          AlarmData alarmData = AlarmData(
              id: Uuid().v4(),
              alarmTime: DateFormat("HH:mm").format(DateTime.now()),
              repeatedDays: [0, 0, 0, 0, 0, 0, 0],
              label: "Alarm",
              isActive: true);
          showAlarmConfigScreen(context, ref,
              alarmData: alarmData, newAlarm: true);
        },
      ),
    );
  }
}
