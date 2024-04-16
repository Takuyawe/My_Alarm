#!/bin/bash

# 現在実行中の Flutter macOS アプリのプロセスを探して終了させる
pkill -f "flutter_tools.*macos"

# Flutter アプリを再起動
cd /Users/nemototakuya/workspace/dev/personal/my_alarm
flutter run -d macos

# crontab -e
# * */1 * * * /Users/nemototakuya/workspace/dev/personal/my_alarm/run_flutter.sh