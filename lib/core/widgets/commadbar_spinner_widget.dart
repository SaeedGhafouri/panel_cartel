import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

import 'package:flutter/material.dart';

class CommadbarSpinnerWidget extends StatefulWidget {
  final String text;
  final List<String> items;
  final IconData? icon;
  final Color? textColor;
  final Color? background;
  final double? height;
  final double? iconSize;
  final double? elevation;
  final TextStyle? textStyle;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final MainAxisAlignment? alignment;

  const CommadbarSpinnerWidget({
    required this.text,
    required this.items,
    this.icon,
    this.textColor,
    this.background,
    this.height,
    this.elevation,
    this.textStyle,
    this.iconColor,
    this.onPressed,
    this.iconSize,
    this.alignment,
  });

  @override
  _CommadbarSpinnerWidgetState createState() => _CommadbarSpinnerWidgetState();
}

class _CommadbarSpinnerWidgetState extends State<CommadbarSpinnerWidget> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50.0, // Default height
      child: DropdownButton<String>(
        value: selectedItem,
        hint: Row(
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
            Text(
              widget.text,
              style: widget.textStyle ?? TextStyle(
                color: widget.textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
                fontFamily: font_regular,
                fontSize: txt_20,
              ),
            ),
          ],
        ),
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(), // Hide the underline
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: widget.textStyle ?? TextStyle(
                color: widget.textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
                fontFamily: font_regular,
                fontSize: txt_20,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue;
          });
          if (widget.onPressed != null) {
            widget.onPressed!(); // Call the onPressed callback if set
          }
        },
        style: TextStyle(
          fontFamily: font_regular,
          color: widget.textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
        ),
        dropdownColor: widget.background ?? Theme.of(context).cardColor,
      ),
    );
  }
}

