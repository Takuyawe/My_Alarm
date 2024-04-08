import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    var flutterViewController: FlutterViewController!

    func applicationDidFinishLaunching(_ notification: Notification) {
        guard let window = NSApplication.shared.windows.first else {
            return
        }
        self.window = window

        // 最小化ボタンを無効にする
        window.standardWindowButton(.miniaturizeButton)?.isEnabled = false

        // アプリを最大化する
        window.setFrame(NSRect(x: 0, y: 0, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height), display: true)

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
