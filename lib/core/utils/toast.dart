import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:toastification/toastification.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

void showToast({
  required BuildContext context,
  required String message,
  ToastType type = ToastType.error,
  Duration duration = const Duration(seconds: 3),
  Alignment alignment = Alignment.bottomRight,
}) {
  IconData icon;
  Color iconColor;
  switch (type) {
    case ToastType.error:
      icon = IconsaxPlusLinear.danger;
      iconColor = Colors.red;
      break;
    case ToastType.success:
      icon = IconsaxPlusLinear.tick_circle;
      iconColor = Colors.green;
      break;
    case ToastType.warning:
      icon = IconsaxPlusLinear.warning_2;
      iconColor = Colors.orange;
      break;
    case ToastType.info:
      icon = IconsaxPlusLinear.info_circle;
      iconColor = Colors.blue;
      break;
  }

  toastification.show(
    context: context,
    title: Text(
      message.replaceAll('Exception:', ''),
      style: Theme.of(context).textTheme.bodySmall,
    ),
    showProgressBar: true,
    icon: Icon(icon, color: iconColor),
    borderRadius: smallRadius,
    autoCloseDuration: duration,
    alignment: alignment,
    direction: TextDirection.rtl,
    backgroundColor: iconColor.withOpacity(0.3),
    borderSide: BorderSide.none,
  );
}

//Enum
enum ToastType {
  error,
  success,
  warning,
  info,
}
