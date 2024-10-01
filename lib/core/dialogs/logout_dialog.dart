import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/features/auth/logic/storage/expert/expert_preferences.dart';

import '../themes/themes.dart';
import '../utils/app_routes.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSmall),
      ),
      backgroundColor: Theme.of(context).cardColor,
      icon: const Icon(IconsaxPlusLinear.logout, color: dangerColor, size: 40,),
      title: Text('خروج از حساب کاربری', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,),
      content: Text('آیا از خروج از حساب کاربری خود اطمینان دارید؟', style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        ButtonWidget(
          text: 'خروج',
          background: dangerColor,
          onPressed: () => {
            ExpertPreferences.clearUserInfo(),
            context.go(AppRoutes.login),
          },
        ),
        const SizedBox(height: spacingThin,),
        ButtonWidget(
          text: 'انصراف',
          background: Theme.of(context).cardColor,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}