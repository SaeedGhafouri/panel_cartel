import 'package:flutter/material.dart';
import 'package:panel_cartel/core/themes/themes.dart';

class CheckboxWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;

  const CheckboxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: thinRadius,
          ),
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: value,
          onChanged: onChanged,
        ),
        if (label != null && label!.isNotEmpty)
          Text(
            label!,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
      ],
    );
  }
}
