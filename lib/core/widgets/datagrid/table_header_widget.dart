
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class TableHeaderWidget extends StatelessWidget {
  final List<Widget>? end_children;
  final List<Widget>? start_children;
  final String? title;
  const TableHeaderWidget({super.key, this.end_children, this.start_children, this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FocusScope(
          node: FocusScopeNode(),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: const TextStyle(
                    fontFamily: font_medium,
                    fontSize: txt_20,
                    color: darkTextColor,
                  ),
                ),
              ] else ...[
                const SizedBox(width: spacingThin,),
              ],
              if (end_children != null) ...[
                Row(
                  children: end_children!,
                ),
              ],
              if (start_children != null) ...[
                Row(
                  children: start_children!,
                ),
              ]
            ],
          ),
        ),
        const SizedBox(height: spacingThin,),
        Divider(height: 1, color: Theme.of(context).dividerColor),
        const SizedBox(height: spacingThin,),
      ],
    );
  }
}
