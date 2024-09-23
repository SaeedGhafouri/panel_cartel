
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../dialogs/category_dialog.dart';
import '../themes/themes.dart';

class ButtonPopupWidget extends StatefulWidget {
  final Widget widgetDialog;
  final String value;
  final IconData? icon;

  const ButtonPopupWidget({super.key, required this.widgetDialog, required this.value, this.icon});

  @override
  State<ButtonPopupWidget> createState() => _ButtonPopupWidgetState();
}

class _ButtonPopupWidgetState extends State<ButtonPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (BuildContext context) {
            return widget.widgetDialog;
          },
        );
      },
      child: Container(
        height: heightFieldMain,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(
                context)
                .dividerColor,
          ),
          borderRadius:
          BorderRadius.circular(radiusSmall),
        ),
        padding:
        const EdgeInsets.all(
            spacingThin),
        child: Row(
          children: [
            if (widget.icon != null) ... [
              Icon(widget.icon, color: Theme.of(context).hintColor, size: 17),
              const SizedBox(
                  width: spacingThin),
            ],

            Text(
                widget.value,
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: txt_20
                )
            ),
          ],
        ),
      ),
    );
  }
}
