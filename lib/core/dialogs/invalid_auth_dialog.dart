import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/dialogs/logout_dialog.dart';

import '../themes/themes.dart';
import '../utils/app_routes.dart';
import '../widgets/button_widget.dart';

class InvalidAuthDialog extends StatelessWidget {
  const InvalidAuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSmall),
      ),
      backgroundColor: Theme.of(context).cardColor,
      icon: const Icon(IconsaxPlusLinear.danger, color: dangerColor, size: 40,),
      title: Text('احراز هویت نامعتبر', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: dangerColor), textAlign: TextAlign.center,),
      content: Text('لطفاً برای ادامه استفاده از سیستم، مجدداً وارد شوید', style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        ButtonWidget(
          text: 'ورود به حساب',
          background: Theme.of(context).dividerColor,
          onPressed: () => {
            context.go(AppRoutes.login)
          },
        ),
      ],
    );
  }
}