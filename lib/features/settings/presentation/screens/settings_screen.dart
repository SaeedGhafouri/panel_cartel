import 'package:flutter/material.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import '../../../../core/themes/themes.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const AppBarMain(),
              Expanded(child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: containerHorizontal),
                child: Column(

                  children: [
                    HeaderMain(
                      title: 'تنظیمات',
                      crumbs: const [
                        'داشبورد',
                        'تنظیمات',
                      ],

                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //پیکربندی پایه
                        Expanded(
                          flex: 3,
                          child: FormWidget(
                              body: Column(
                                children: [
                                  TableHeaderWidget(
                                    title: 'تنظبمات',
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
