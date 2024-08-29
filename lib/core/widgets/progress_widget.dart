import 'package:flutter/material.dart';

import '../themes/themes.dart';

class ProgressWidget extends StatefulWidget {
  @override
  _ProgressWidget createState() => _ProgressWidget();
}

class _ProgressWidget extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Padding(
        padding: padding_10,
        child: CircularProgressIndicator(

          strokeWidth: 3,
          color: primaryColor,
        ),
      ),
      );
  }
}