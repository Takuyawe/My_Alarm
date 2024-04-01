import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static const platform = MethodChannel("com.example.my_alarm/focus");

  Future<void> _bringAppToFront() async {
    try {
      await platform.invokeMethod("bringToFront");
    } on PlatformException catch (e) {
      print("Failed to bring app to front: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), _onTimer);
  }

  void _onTimer() {
    _bringAppToFront();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text("hi"),
    );
  }
}
