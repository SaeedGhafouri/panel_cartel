import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../constants/assets.dart';
import '../themes/themes.dart';
import '../utils/app_routes.dart';

class HeaderMain extends StatefulWidget {
  final String? title;
  final List<String>? crumbs;
  final List<Widget>? startChildren;

  HeaderMain({
    this.title,
    this.crumbs,
    this.startChildren,
  });

  @override
  _HeaderMainState createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              navigateBack(context);
                        }, icon: Icon(IconsaxPlusLinear.arrow_right_3, size: 20 , color: Theme.of(context).iconTheme.color?.withOpacity(0.4),)
                        ),
                        Text(
                          widget.title ?? '',
                          style: const TextStyle(
                            fontFamily: font_bold,
                            fontSize: txt_50,
                          ),
                        ),
                      ],
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
                                    fontSize: txt_30),
                              ),
                              if (i < widget.crumbs!.length - 1)
                                const TextSpan(
                                  text: ' / ',
                                  style: TextStyle(
                                      fontSize: txt_20,
                                      color: gray500Color,
                                      fontFamily: font_regular),
                                ),
                            ],
                          ],
                        ),
                      ),
                    const SizedBox(height: spacingLarg),
                  ],
                )),
                Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                  children: widget.startChildren ?? [],
                ))
              ],
            )));
  }
  void navigateBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      context.go(AppRoutes.dashboard);
    }
  }

}
