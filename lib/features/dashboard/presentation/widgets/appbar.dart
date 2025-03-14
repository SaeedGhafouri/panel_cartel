import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../../../core/widgets/image_diplay_widget.dart';
import 'profile_popup_widget.dart';

class AppBarMain extends StatelessWidget {
  final VoidCallback onMenuPressed;
  const AppBarMain({Key? key, required this.onMenuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Jalali jDate = Jalali.now();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfilePopupWidget(),
              SizedBox(width: 20,),
              VerticalDivider(width: 4, color: Colors.redAccent),
              SizedBox(width: 20,),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    IconsaxPlusLinear.notification,
                    size: 20,
                  )
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${jDate.formatter.wN} ${jDate.day}/${jDate.formatter.mN}/${jDate.year}',
                style: const TextStyle(
                  fontFamily: font_regular,
                ),
              ),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    IconsaxPlusLinear.search_normal,
                    size: 20,
                  )
              ),

              SizedBox(width: 20,),

              IconButton(
                icon: Icon(IconsaxPlusLinear.menu, ),
                onPressed: onMenuPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
