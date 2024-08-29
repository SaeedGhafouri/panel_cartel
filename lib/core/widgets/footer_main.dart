
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/themes.dart';
class FooterMain extends StatefulWidget {
  @override
  _FooterMain createState() => _FooterMain();
}

class _FooterMain extends State<FooterMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: foregroundColor,
      padding: padding_20,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        ],
      ),
    );
  }
}
