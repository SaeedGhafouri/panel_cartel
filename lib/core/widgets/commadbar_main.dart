import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

class CommadbarWidget extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Color? textColor;
  final Color? background;
  final double? height;
  final double? iconSize;
  final double? elevation;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Widget? child;
  final VoidCallback? onPressed;
  final MainAxisAlignment? alignment;

  CommadbarWidget({
    required this.text,
    this.icon,
    this.textColor,
    this.background,
    this.height,
    this.elevation,
    this.textStyle,
    this.iconColor,
    this.onPressed,
    this.iconSize,
    this.child,
    this.alignment,
  });

  @override
  _CommadbarWidgetState createState() => _CommadbarWidgetState();
}

class _CommadbarWidgetState extends State<CommadbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? heightCmdBrMain,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background ?? Theme.of(context).cardColor,
          elevation: widget.elevation ?? 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: smallRadius,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.alignment ?? MainAxisAlignment.center,
          children: [

            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                size: widget.iconSize ?? 17,
                color: widget.iconColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              ),
              const SizedBox(width: 5,),
            ],
            if (widget.text.isNotEmpty) ...[
              Text(
                widget.text,
                style: widget.textStyle ?? TextStyle(
                  color: widget.textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                  fontSize: txt_20,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

