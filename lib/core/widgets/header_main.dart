import 'package:flutter/material.dart';
import '../constants/assets.dart';
import '../themes/themes.dart';

class HeaderMain extends StatefulWidget {
  final String? title;
  final List<String>? crumbs;

  HeaderMain({
    this.title,
    this.crumbs,
  });

  @override
  _HeaderMainState createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.title ?? '',
              style: const TextStyle(
                fontFamily: font_bold,
                fontSize: txt_50,
              ),
            ),
            const SizedBox(height: spacingThin),
            if (widget.crumbs != null && widget.crumbs!.isNotEmpty)
              RichText(
                text: TextSpan(
                  children: [
                    for (int i = 0; i < widget.crumbs!.length; i++) ...[
                      TextSpan(
                        text: widget.crumbs![i],
                        style: const TextStyle(
                            color: grayTextColor,
                            fontFamily: font_regular,
                            fontSize: txt_30
                        ),
                      ),
                      if (i < widget.crumbs!.length - 1)
                        const TextSpan(
                          text: ' / ',
                          style: TextStyle(
                              fontSize: txt_20,
                              color: gray500Color,
                              fontFamily: font_regular
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            const SizedBox(height: spacingLarg),
          ],
        )));
  }
}
