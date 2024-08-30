import 'package:flutter/material.dart';
import '../themes/themes.dart';

class FormWidget extends StatefulWidget {
  final Widget body;
  final double? width;
  final double? height;

  const FormWidget({super.key, required this.body, this.width, this.height});
  @override
  _FormWidget createState() => _FormWidget();
}

class _FormWidget extends State<FormWidget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? null,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: smallRadius,
            ),
            child: Padding(
                padding: padding_30,
                child: widget.body
            ),
          ),
        ],
      )
    );
  }
}
