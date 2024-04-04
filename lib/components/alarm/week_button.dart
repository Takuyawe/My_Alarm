import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_alarm/importer.dart';

class WeekButton extends ConsumerStatefulWidget {
  final int weekDayNum;
  final bool isRepeated;
  final Function(int) onToggleButton;
  const WeekButton(
      {super.key,
      required this.weekDayNum,
      required this.isRepeated,
      required this.onToggleButton});

  @override
  ConsumerState<WeekButton> createState() => _WeekButtonState();
}

class _WeekButtonState extends ConsumerState<WeekButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: receive params: [weekDay, isRepeated]
    return TextButton(
        onPressed: () {
          widget.onToggleButton(widget.weekDayNum);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(BorderSide(
                color: widget.isRepeated ? transparent : white, width: 1)),
            fixedSize: MaterialStateProperty.all(const Size(40, 35)),
            // TODO: change color depending on whether it's checked or not
            backgroundColor: widget.isRepeated
                ? MaterialStateProperty.all(white)
                : MaterialStateProperty.all(baseDarkColor)),
        child: Text(getWeekDay(widget.weekDayNum),
            style: TextStyle(
                color: widget.isRepeated ? baseDarkColor : white,
                fontWeight: FontWeight.w300)));
  }
}
