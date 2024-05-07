#!/bin/bash

# Flutterアプリを起動
flutter run -d macos &

# FlutterプロセスのIDを取得
FLUTTER_PID=$!

# Flutterプロセスが動作している間、30分ごとに "shift+r" を送信
while kill -0 $FLUTTER_PID 2> /dev/null; do
  # 1800秒待機 (30分)
  sleep 1800
  # "shift+r" を送信
  cliclick kd:shift t:r ku:shift
done

echo "Flutter process has terminated."
