import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../constants/assets.dart';
import '../../themes/themes.dart';

class ItemColumn extends StatelessWidget {
  final String mobile;
  final bool isVerified;

  const ItemColumn({
    Key? key,
    required this.mobile,
    required this.isVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mobile,
          style: const TextStyle(
            fontFamily: font_regular,
            color: darkTextColor,
            fontSize: txt_20,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  isVerified
                      ? IconsaxPlusLinear.tick_circle
                      : IconsaxPlusLinear.close_circle,
                  size: 12,
                  color: isVerified ? successColor : dangerColor,
                ),
              ),
              TextSpan(
                text: isVerified ? ' تایید شده' : ' تایید نشده',
                style: TextStyle(
                  fontFamily: font_regular,
                  color: isVerified ? successColor : dangerColor,
                  fontSize: txt_10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
