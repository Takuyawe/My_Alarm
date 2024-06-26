import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';

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
    final scheduleAlarmProvider = ref.read(scheduleAlarmRepositoryProvider);
    final navigatorKey = ref.read(navigatorKeyProvider);
    scheduleAlarmProvider.scheduleAlarm(
        navigatorKey, alarmDataList, updateAlarmDataList);
    scheduleAlarmProvider.resetAtDateChanged(
        navigatorKey, alarmDataList, updateAlarmDataList);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> updateAlarmDataList() async {
    final provider = ref.read(alarmRepositoryProvider);
    final prefs = await provider.getSharedPreferences();
    final _alarmDataList = await provider.getAlarmData(prefs);
    setState(() {
      alarmDataList = _alarmDataList;
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
      appBar: AppBar(
          backgroundColor: baseDarkColor,
          title: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't work hard !!",
                        style: TextStyle(color: white, fontSize: 40)),
                    Divider(
                        color: white, thickness: 2, indent: 20, endIndent: 20),
                  ]))),
      body: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8.0,
          runSpacing: 4.0,
          children: alarmDataList
              .map((alarmData) => AlarmCard(
                  alarmData: alarmData,
                  updateAlarmDataList: updateAlarmDataList))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightBlue,
        child: const Icon(Icons.add),
        onPressed: () {
          AlarmData alarmData = getDefaultAlarmData();
          showAlarmConfigScreen(context, ref,
              alarmData: alarmData,
              newAlarm: true,
              updateAlarmDataList: updateAlarmDataList);
        },
      ),
    );
  }
}
