
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class TableHeaderWidget extends StatelessWidget {
  final List<Widget>? endChildren;
  final List<Widget>? startChildren;
  final String? title;
  const TableHeaderWidget({super.key, this.endChildren, this.startChildren, this.title,});

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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ] else ...[
                const SizedBox(width: spacingThin,),
              ],
              if (endChildren != null) ...[
                Row(
                  children: endChildren!,
                ),
              ],
              if (startChildren != null) ...[
                Row(
                  children: startChildren!,
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
