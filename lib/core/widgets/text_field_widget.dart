import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
  final String? errorText;
  final bool isPassword; // Add this flag to identify if it's a password field

  TextFieldWidget({
    this.controller,
    this.label,
    this.hint,
    this.maxEms,
    this.maxHeight,
    this.inputType,
    this.inputFormatters,
    this.errorText,
    this.isPassword = false, // Default to false
  });

  @override
  _TextFieldWidget createState() => _TextFieldWidget();
}

class _TextFieldWidget extends State<TextFieldWidget> {
  bool _isPasswordVisible = false; // Track the visibility of the password

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFieldMain,
      child: TextField(
        keyboardType: widget.inputType ?? TextInputType.text,
        controller: widget.controller,
        obscureText: widget.isPassword && !_isPasswordVisible, // Handle password visibility
        style: const TextStyle(
          fontSize: txt_20,
          fontFamily: font_medium,
        ),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Theme.of(context).hintColor,
            fontFamily: font_regular,
            fontSize: txt_20,
          ),
          errorText: widget.errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: smallRadius,
            borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: smallRadius,
            borderSide: focusedBorderSide,
          ),
          hintText: widget.hint,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              color: Theme.of(context).textTheme.headlineMedium?.color,
              size: 20,
              _isPasswordVisible
                  ? IconsaxPlusLinear.eye
                  : IconsaxPlusLinear.eye_slash,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}
