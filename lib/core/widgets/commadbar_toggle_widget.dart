import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

import 'package:flutter/material.dart';

class CommadbarToggleWidget extends StatefulWidget {
  final String textOn;
  final String textOff;
  final Color? textColor;
  final Color? background;
  final double? height;
  final TextStyle? textStyle;
  final ValueChanged<bool>? onChanged;

  CommadbarToggleWidget({
    required this.textOn,
    required this.textOff,
    this.textColor,
    this.background,
    this.height,
    this.textStyle,
    this.onChanged,
  });

  @override
  _CommadbarToggleWidgetState createState() => _CommadbarToggleWidgetState();
}

class _CommadbarToggleWidgetState extends State<CommadbarToggleWidget> {
  bool isToggled = false;

  void _toggle() {
    setState(() {
      isToggled = !isToggled;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(isToggled ? true : false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50.0, // Default height
      color: widget.background ?? Colors.transparent,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background ?? Theme.of(context).cardColor,
          elevation:0.0,
          shape: RoundedRectangleBorder(
            borderRadius: smallRadius,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        onPressed: _toggle,
        child: Center(
          child: Text(
            isToggled ? widget.textOn : widget.textOff,
            style: widget.textStyle ?? TextStyle(
              color: widget.textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              fontFamily: font_bold,
              fontSize: txt_20,
            ),
          ),
        ),
      ),
    );
  }
}

