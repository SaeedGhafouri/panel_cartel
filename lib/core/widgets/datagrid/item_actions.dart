import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class ItemActions extends StatelessWidget {
  final List<Widget> children;

  const ItemActions({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding_20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
