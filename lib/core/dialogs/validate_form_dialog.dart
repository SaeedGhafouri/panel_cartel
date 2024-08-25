
//show dialog validate form
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../themes/themes.dart';

class ValidateFormDialog {
  static void show(BuildContext context, Map<String, String> errors) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text(
          'فیلد های اجباری',
          textAlign: TextAlign.end,
          style: TextStyle(
              fontFamily: font_bold,
              color: darkTextColor,
              fontSize: txt_40
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: errors.entries.map((entry) =>
                Row(
                  children: [
                    Text(
                      entry.value,
                      style: const TextStyle(
                          fontFamily: font_bold,
                          color: darkTextColor,
                          fontSize: txt_30
                      ),
                    ),
                    const Text(
                      " الزامی است.",
                      style: TextStyle(
                          fontFamily: font_bold,
                          color: grayTextColor,
                          fontSize: txt_30
                      ),
                    ),
                  ],
                )
            ).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'تایید',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: font_bold,
                  color: darkTextColor,
                  fontSize: txt_30
              ),
            ),
          ),
        ],
      ),
    );
  }
}