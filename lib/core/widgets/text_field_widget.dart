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
  final bool isPassword;

  TextFieldWidget({
    this.controller,
    this.label,
    this.hint,
    this.maxEms,
    this.maxHeight,
    this.inputType,
    this.inputFormatters,
    this.errorText,
    this.isPassword = false,
  });

  @override
  _TextFieldWidget createState() => _TextFieldWidget();
}

class _TextFieldWidget extends State<TextFieldWidget> {
  bool _isPasswordVisible = false;
  late TextEditingController _controller;
  String? _currentErrorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _currentErrorText = widget.errorText;
  }

  @override
  void didUpdateWidget(TextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorText != oldWidget.errorText) {
      setState(() {
        _currentErrorText = widget.errorText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentErrorText = null;
        });
      },
      child: SizedBox(
        height: _currentErrorText != null ? 55 : heightBtnMain,
        child: TextField(
          keyboardType: widget.inputType ?? TextInputType.text,
          controller: _controller,
          obscureText: widget.isPassword && !_isPasswordVisible,
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
            errorText: _currentErrorText,
            errorBorder: OutlineInputBorder(
              borderRadius: smallRadius,
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
            errorStyle: const TextStyle(
              color: dangerColor,
              fontFamily: font_regular,
              fontSize: txt_10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: smallRadius,
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
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
          onTap: () {
            setState(() {
              _currentErrorText = null; // Clear the error text on field tap
            });
          },
        ),
      ),
    );
  }
}