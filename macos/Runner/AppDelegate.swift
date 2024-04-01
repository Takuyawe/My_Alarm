import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var flutterViewController: FlutterViewController!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // FlutterViewControllerの取得
        let flutterViewController = NSApplication.shared.windows.first!.contentViewController as! FlutterViewController
        self.flutterViewController = flutterViewController

        // メソッドチャネルの設定
        let methodChannel = FlutterMethodChannel(name: "com.example.my_alarm/focus", binaryMessenger: flutterViewController.engine.binaryMessenger)
        methodChannel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // メソッドコールを受け取る処理
            if call.method == "bringToFront" {
                NSApp.activate(ignoringOtherApps: true)
                NSApp.windows.last?.toggleFullScreen(nil)
                result("macOS window is brought to front")
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // アプリ終了時の処理
    }
}
