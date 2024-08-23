import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/colors.dart';

import '../../../../core/constants/assets.dart';
import 'image_diplay_widget.dart';

class ProfilePopupWidget extends StatelessWidget {
  const ProfilePopupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
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
          const PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مشاهده پروفایل',
                  style: TextStyle(
                    fontFamily: font_regular,
                    fontSize: 12
                  ),
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.user,
                  size: 17,
                ),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'settings',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تنظیمات',
                  style: TextStyle(
                      fontFamily: font_regular,
                      fontSize: 12
                  ),
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.setting,
                  size: 17,
                ),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'activity',
            enabled: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Disable فعالیت',
                  style: TextStyle(
                      fontFamily: font_regular,
                      fontSize: 12
                  ),
                ),
                SizedBox(width: 10,),
                Icon(
                  IconsaxPlusLinear.activity,
                  size: 17,
                ),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'خروج از حساب کاربری',
                  style: TextStyle(
                      fontFamily: font_regular,
                      fontSize: 12,
                    color: Colors.redAccent
                  ),
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
            IconsaxPlusLinear.arrow_square_down,
            size: 20,
            color: Theme.of(context).hintColor,
          ),
          SizedBox(width: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'سعید غفوری',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: font_bold,
                ),
              ),
              Text(
                'مدیرعامل',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: font_regular,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          ImageDisplayWidget(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDdst0jyv1JAuiWlWtsHEmBx2v9nkKedzcgg&s',
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
