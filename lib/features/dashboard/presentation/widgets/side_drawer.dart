
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/constants/assets.dart';

import '../../../../core/themes/theme_bloc.dart';
import '../../../../core/themes/theme_event.dart';

class SideDrawer extends StatelessWidget {
  final Function(int) onTap;

  SideDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            svg_logo,
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'کارتل ویژن',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Triggering theme toggle event
                          BlocProvider.of<ThemeBloc>(context)
                              .add(ToggleThemeEvent());
                        },
                        child: Container(
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconsaxPlusLinear.moon,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 15,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  'پوسته: روشن / تیره',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              ListTile(
                title: Text('آمار کلی',
                    style: Theme.of(context).textTheme.bodyMedium),
                style: ListTileStyle.drawer,
                leading: Icon(IconsaxPlusLinear.home, size: 20,),
                onTap: () => onTap(0),
              ),
              ListTile(
                title: Text('کارشناسان',
                    style: Theme.of(context).textTheme.bodyMedium),
                style: ListTileStyle.drawer,
                leading: Icon(IconsaxPlusLinear.user_tick, size: 20,),
                onTap: () => onTap(1),
              ),
            ],
          ),
        ));
  }
}
