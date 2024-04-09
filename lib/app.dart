import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:my_alarm/importer.dart";

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: ref.read(navigatorKeyProvider),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
