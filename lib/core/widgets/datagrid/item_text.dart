import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class ItemText extends StatelessWidget {
  final String value;

  const ItemText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        value,
        style: const TextStyle(
          fontFamily: font_regular,
          color: darkTextColor,
          fontSize: txt_20,
        ),
      ),
    );
  }
}
