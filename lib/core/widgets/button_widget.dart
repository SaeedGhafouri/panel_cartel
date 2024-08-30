import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Color? textColor;
  final Color? background;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? elevation;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Widget? child;
  final VoidCallback? onPressed;
  final MainAxisAlignment? alignment;

  ButtonWidget({
    required this.text,
    this.icon,
    this.textColor,
    this.background,
    this.width,
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
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? heightBtnMain,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background ?? primaryColor,
          elevation: widget.elevation ?? 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: smallRadius,
          ),
        ),
        onPressed: widget.onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: widget.alignment ?? MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: widget.iconSize ?? 15,
                    color: widget.iconColor ?? lightTextColor,
                  ),
                  SizedBox(width: 8.0),
                ],
                if (widget.text != null) ...[
                  Text(
                    widget.text,
                    style: widget.textStyle ?? TextStyle(
                        color: widget.textColor ?? lightTextColor,
                        fontFamily: font_regular,
                        fontSize: txt_20
                    ),
                  ),
                ],

              ],
            ),
            if (widget.child != null) // Display child widget if provided
              widget.child!,
          ],
        ),
      ),
    );
  }
}