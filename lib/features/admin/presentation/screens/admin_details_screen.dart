
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/commadbar_main.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/card_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';

class AdminDetailsScreen extends StatefulWidget {
  const AdminDetailsScreen({Key? key}) : super(key: key);
  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  //Person
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nationalCode = TextEditingController();
  final TextEditingController _sex = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: FormMain(
                          body: Column(
                            children: [
                              ImageDisplayWidget(

                              ),
                              const SizedBox(height: spacingSmall),
                              //Change image
                              GestureDetector(
                                onDoubleTap: () {

                                },
                                child: const Row(
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
                          body: Column(
                            children: [
                              TableHeaderWidget(
                                title: 'اطلاعات کاربری',
                                end_children: [
                                  CommadbarWidget(
                                    text: 'ویرایش',
                                    icon: IconsaxPlusLinear.edit,
                                    onPressed: () {
                                      // Action for edit
                                    },
                                  ),
                                  CommadbarWidget(
                                    text: 'حذف',
                                    icon: IconsaxPlusLinear.trash,
                                    iconColor: dangerColor,
                                    textColor: dangerColor,
                                    onPressed: () {
                                      // Action for delete
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingThin),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _firstName,
                                                label: 'نام',
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _lastName,
                                                label: 'نام خانوادگی',
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _nationalCode,
                                                label: 'کد ملی',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: spacingThin),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _password,
                                                label: 'رمز عبور',
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _email,
                                                label: 'ایمیل',
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _sex,
                                                label: 'جنسیت',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: spacingThin),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _telephone,
                                                label: 'تلفن ثابت',
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _phone,
                                                label: 'شماره موبایل',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
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

