import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/widgets/profile_popup_widget.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../themes/themes.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Jalali jDate = Jalali.now();
    return Directionality(textDirection: TextDirection.ltr, child: Container(
      padding: const EdgeInsets.symmetric(horizontal: containerHorizontal, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ProfilePopupWidget(
                id: 1,
                username: 'سعید غفوری',
                role: 'مدیرعامل',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUUF7_VlWCXwMR8E-pADupaSq-41cH1QEcVz1D6hz51TcgO-BGwz_FnoBQTxvVDCcvQ5g&usqp=CAU',
              ),
              const SizedBox(width: spacingSmall,),
              Container(width: 1, height: 40, color:  Theme.of(context).dividerColor,),
              const SizedBox(width: spacingThin,),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    IconsaxPlusLinear.notification,
                    size: 18,
                  )
              ),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    IconsaxPlusLinear.activity,
                    size: 18,
                  )
              ),
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    IconsaxPlusLinear.calendar,
                    size: 18,
                  )
              ),
              Text(
                '${jDate.formatter.wN} ${jDate.day}/${jDate.formatter.mN}/${jDate.year}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(IconsaxPlusLinear.menu, ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
