
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';

class AdminDetailsScreen extends StatefulWidget {
  const AdminDetailsScreen({Key? key}) : super(key: key);
  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Container(
              padding: container,
              margin: container,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HeaderMain(
                    title: 'پروفایل کارشناس',
                    crumbs: const [
                      'داشبورد',
                      'کارشناسان',
                      'پروفایل کارشناس'
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: FormMain(
                          body: Column(
                            children: [
                              const SizedBox(
                                height: 120,
                                width: 120,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      ''),
                                ),
                              ),
                              const SizedBox(height: spacingSmall),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(IconsaxPlusLinear.edit, size: 15, color: grayIconColor),
                                  Text(
                                    ' ویرایش تصویر',
                                    style: TextStyle(
                                      fontSize: txt_20,
                                      color: grayTextColor,
                                      fontFamily: font_regular,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingThin),
                              const Divider(height: 1, color: grayDividerColor),
                              const SizedBox(height: spacingThin),
                              Column(
                                children: [
                                  buildProfileInfoRow(
                                      IconsaxPlusLinear.personalcard, 'نام و نام خانوادگی:', ''),
                                  buildProfileInfoRow(IconsaxPlusLinear.mobile, 'شماره موبایل:', ''),
                                  buildProfileInfoRow(
                                      IconsaxPlusLinear.message, 'ایمیل:', ''),
                                ],
                              ),
                              const SizedBox(height: spacingThin),
                              const Divider(height: 1, color: grayDividerColor),
                              const SizedBox(height: spacingThin),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: spacingSmall,),
                      Expanded(
                        flex: 7,
                        child: FormMain(
                          body: Text('saeed'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  Widget buildProfileInfoRow(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: spacingThin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: grayIconColor, size: 15),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontFamily: font_regular,
              fontSize: txt_20,
              color: grayTextColor,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: font_bold,
              fontSize: txt_30,
              color: darkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

