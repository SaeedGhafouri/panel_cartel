import 'package:flutter/material.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StatusSwitchWidget extends StatefulWidget {
  final void Function(int) onToggle;
  final double? minWidth;
  final double? minHeight;

  const StatusSwitchWidget({
    Key? key,
    required this.onToggle, this.minWidth, this.minHeight,
  }) : super(key: key);

  @override
  _StatusSwitchWidgetState createState() => _StatusSwitchWidgetState();
}

class _StatusSwitchWidgetState extends State<StatusSwitchWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: widget.minWidth ?? 80,
      minHeight: widget.minHeight ?? 35,
      radiusStyle: true,
      animationDuration: 300,
      animate: true,
      activeFgColor: Colors.white,
      inactiveFgColor: Theme.of(context).dividerColor,
      inactiveBgColor: Theme.of(context).dividerColor.withOpacity(0.5),
      totalSwitches: 2,
      labels: ['فعال', 'غیرفعال'],
      customTextStyles: const [
        TextStyle(fontSize: 12),
        TextStyle(fontSize: 12),
      ],
      initialLabelIndex: currentIndex, // مقدار اولیه را تعیین کنید
      onToggle: (index) {
        setState(() {
          currentIndex = index!; // مقدار جدید را به currentIndex نسبت دهید
          widget.onToggle(currentIndex); // برگرداندن مقدار 0 یا 1
        });
      },
    );
  }
}