import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'image_diplay_widget.dart';

class ProfilePopupWidget extends StatelessWidget {
  final double id;
  final String username;
  final String role;
  final String? imageUrl;
  const ProfilePopupWidget({Key? key, required this.id, required this.username, required this.role, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Theme.of(context).cardColor,
      position: PopupMenuPosition.under,
      onSelected: (value) {
        switch (value) {
          case 'profile':
            break;
          case 'activity':
            break;
          case 'settings':
            break;
          case 'logout':
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مشاهده پروفایل',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.user,
                  size: 17,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'settings',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تنظیمات',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.setting,
                  size: 17,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'activity',
            enabled: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Disable فعالیت',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.activity,
                  size: 17,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'خروج از حساب کاربری',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.logout,
                  color: Colors.redAccent,
                  size: 17,
                ),
              ],
            ),
          ),
        ];
      },
      child: Row(
        children: [
          Icon(
            IconsaxPlusLinear.arrow_down,
            size: 17,
            color: Theme.of(context).hintColor,
          ),
          SizedBox(width: 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                username,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                role,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          SizedBox(width: 10),
          ImageDisplayWidget(
            radius: radiusSmall,
            imageUrl: imageUrl ,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
