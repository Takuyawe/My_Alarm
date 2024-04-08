import 'package:my_alarm/importer.dart';

class SwiftPlatformService {
  static const platform = MethodChannel(swiftChannelName);

  static Future<void> bringAppToFront() async {
    try {
      await platform.invokeMethod(swiftFuncName);
    } on PlatformException catch (e) {
      print("Failed to bring app to front: '${e.message}'.");
    }
  }
}
