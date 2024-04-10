#!/bin/bash

while true; do
  # FlutterプロセスのPIDを取得し終了
  FLUTTER_PID=$(pgrep -f "flutter_tools.*macos")
  if [ ! -z "$FLUTTER_PID" ]; then
    echo "Flutter process found: $FLUTTER_PID. Terminating..."
    kill $FLUTTER_PID
  fi

  # 一定時間待ってからFlutterアプリを再起動（安全のための小休止）
  sleep 5

  # Flutterアプリを実行
  echo "Starting flutter run..."
  flutter run -d macos

  # 指定した時間（例：1時間）待つ
  echo "Waiting for the next restart..."
  sleep 3600
done