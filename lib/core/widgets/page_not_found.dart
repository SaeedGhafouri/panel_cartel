import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';

import '../utils/app_routes.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404',
            style: TextStyle(
                fontSize: 90,
                fontFamily: font_bold,
                color: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.color
                    ?.withOpacity(0.1)),
          ),
          Text('متاسفانه، این صفحه پیدا نشد',
              style: TextStyle(
                  fontSize: txt_30,
                  fontFamily: font_bold,
                  color: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.color
                      ?.withOpacity(0.3))),
          SizedBox(
            height: spacingSmall,
          ),
          SizedBox(
            width: 180,
            child: ButtonWidget(
              onPressed: () {
                context.go(AppRoutes.dashboard);
              },
              text: 'به داشبورد بروید',
            ),
          )
        ],
      ),
    ));
    /*return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه پیدا نشد'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('متاسفانه، این صفحه پیدا نشد.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.dashboard);
              },
              child: const Text('به داشبورد بروید'),
            ),
          ],
        ),
      ),
    );*/
  }
}
