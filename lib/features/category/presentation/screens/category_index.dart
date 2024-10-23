import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';

class CategoryIndexScreen extends StatefulWidget {
  static const String routeName = '/categories';
  const CategoryIndexScreen({super.key});

  @override
  State<CategoryIndexScreen> createState() => _CategoryIndexScreenState();
}

class _CategoryIndexScreenState extends State<CategoryIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              AppBarMain(),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderMain(
                          title: 'دسته بندی ها',
                          crumbs: [
                            'داشبورد',
                            'فروشگاه',
                            'دسته بندی ها'
                          ],
                        ),
                      ],

                    ),
                  )
              ),
            ],
          )
      ),
    );
  }
}
