
import 'package:flutter/material.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class TableColumnWidget extends StatelessWidget {
  final List<dynamic>? values;
  final List<Widget>? actions;
  const TableColumnWidget({super.key, required this.values, this.actions});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: Column(
      children: [
        FocusScope(
          node: FocusScopeNode(),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: actions!,
                    )
                ),
                for (var value in values!) ...[
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildCell(value, context)
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildCell(dynamic value, BuildContext context) {
    if (value is String && value.startsWith('http')) {
      return ImageDisplayWidget(
        imageUrl: value,
      );
    } else if (value is List && _isCategory(value)) {
      return Wrap(
        spacing: 2.0,
        runSpacing: 2.0,
        children: value.map<Widget>((category) {
          return Chip(
            label: Text(category, style: Theme.of(context).textTheme.headlineMedium,),
            backgroundColor: Theme.of(context).chipTheme.backgroundColor,
          );
        }).toList(),
      );
    } else if (value is String && _isEmail(value)) {
      return Text(
        value,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      );
    } else if (value is String && _isPhoneNumber(value)) {
      return Text(
        value,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        value.toString(),
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      );
    }
  }

  bool _isEmail(String value) {
    return value.contains('@');
  }

  bool _isPhoneNumber(String value) {
    return value.length == 11 && value.startsWith('09');
  }

  bool _isCategory(dynamic value) {
    return value is List<dynamic>;
  }
}
