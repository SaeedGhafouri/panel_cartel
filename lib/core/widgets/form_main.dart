import 'package:flutter/material.dart';
import '../themes/themes.dart';

class FormMain extends StatefulWidget {
  final Widget body;
  final double? width;
  final double? height;

  const FormMain({super.key, required this.body, this.width, this.height});
  @override
  _FormMain createState() => _FormMain();
}

class _FormMain extends State<FormMain> {

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
