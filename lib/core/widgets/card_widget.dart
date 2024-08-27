import 'package:flutter/material.dart';
import '../themes/themes.dart';

class CardWidget extends StatefulWidget {
  final Widget body;
  final double? width;
  final double? height;

  const CardWidget({super.key, required this.body, this.width, this.height});
  @override
  _CardWidget createState() => _CardWidget();
}

class _CardWidget extends State<CardWidget> {

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
