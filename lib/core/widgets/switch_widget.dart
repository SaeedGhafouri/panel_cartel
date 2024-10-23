import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchWidget extends StatefulWidget {
  final void Function(int) onToggle;
  final double? minWidth;
  final double? minHeight;

  const SwitchWidget({
    Key? key,
    required this.onToggle, this.minWidth, this.minHeight,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: widget.minWidth ?? 40,
      minHeight: widget.minHeight ?? 30,
      radiusStyle: true,
      animationDuration: 300,
      animate: true,
      activeFgColor: Colors.white,
      inactiveFgColor: Theme.of(context).textTheme.headlineMedium?.color,
      inactiveBgColor: Theme.of(context).dividerColor.withOpacity(0.5),
      totalSwitches: 2,
      customTextStyles: const [
        TextStyle(fontSize: 12),
      ],
      activeBgColor: [
        Theme.of(context).primaryColor,
      ],
      initialLabelIndex: currentIndex,
      onToggle: (index) {
        setState(() {
          currentIndex = index!;
          widget.onToggle(currentIndex);
        });
      },
    );
  }
}