import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int? maxEms;
  final int? maxHeight;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  TextFieldWidget({
    this.controller,
    this.label,
    this.hint,
    this.maxEms,
    this.maxHeight,
    this.inputType,
    this.inputFormatters,
  });

  @override
  _TextFieldWidget createState() => _TextFieldWidget();
}

class _TextFieldWidget extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFieldMain,
      child: TextField(
        keyboardType: widget.inputType ?? TextInputType.text,
        controller: widget.controller,

        style: const TextStyle(
          fontSize: txt_20,
          fontFamily: font_medium,
        ),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: grayTextColor,
            fontFamily: font_regular,
            fontSize: txt_20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: smallRadius,
            borderSide: defaultBorderSide,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: smallRadius,
            borderSide: focusedBorderSide,
          ),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
