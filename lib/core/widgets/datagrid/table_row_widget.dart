
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class TableRowWidget extends StatelessWidget {
  final List<String>? row_titles;
  const TableRowWidget({super.key, required this.row_titles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FocusScope(
          node: FocusScopeNode(),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < row_titles!.length; i++) ...[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        row_titles![i],
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
