import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_details_screen.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/side_drawer.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/';

  const DashboardScreen({Key? key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          AppBarMain(),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Card(
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: smallRadius
                    ),
                    child: Padding(
                      padding: padding_20,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(
                              IconsaxPlusLinear.box,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20,),
                          const Column(
                            children: [
                              Text(
                                "مشتریان",
                                style: TextStyle(
                                    fontSize: txt_20,
                                    fontFamily: font_regular,
                                    color: grayTextColor
                                ),
                              ),
                              Text(
                                "1452",
                                style: TextStyle(
                                    fontSize: txt_60,
                                    fontFamily: font_bold,
                                    color: darkTextColor
                                ),
                              ),
                              Text(
                                "حساب فعال",
                                style: TextStyle(
                                    fontSize: txt_10,
                                    fontFamily: font_regular,
                                    color: grayTextColor
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30,),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(IconsaxPlusLinear.arrow_square_left, color: grayIconColor,)
                          )
                        ],
                      ),
                    )
                ),
                Card(
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: smallRadius
                    ),
                    child: Padding(
                      padding: padding_20,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(
                              IconsaxPlusLinear.box,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20,),
                          const Column(
                            children: [
                              Text(
                                "مشتریان",
                                style: TextStyle(
                                    fontSize: txt_20,
                                    fontFamily: font_regular,
                                    color: grayTextColor
                                ),
                              ),
                              Text(
                                "1452",
                                style: TextStyle(
                                    fontSize: txt_60,
                                    fontFamily: font_bold,
                                    color: darkTextColor
                                ),
                              ),
                              Text(
                                "حساب فعال",
                                style: TextStyle(
                                    fontSize: txt_10,
                                    fontFamily: font_regular,
                                    color: grayTextColor
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30,),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(IconsaxPlusLinear.arrow_square_left, color: grayIconColor,)
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          )
          
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
