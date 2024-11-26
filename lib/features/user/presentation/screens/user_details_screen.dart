import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/commadbar_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/features/admin/logic/cubit/show/admin_show_cubit.dart';
import 'package:tab_container/tab_container.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/error_response_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../data/models/user_model.dart';
import '../../logic/cubit/show/user_show_cubit.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String routeName = '/userDetails';
  final double? userId;
  const UserDetailsScreen({Key? key, this.userId}) : super(key: key);
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  //Person
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nationalCode = TextEditingController();
  final TextEditingController _economicCode = TextEditingController();
  late int _sex;
  @override
  void initState() {
    super.initState();
    context.read<UserShowCubit>().show(widget.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarMain(),
          Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: containerHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HeaderMain(
                        title: 'پروفایل مشتری',
                        crumbs: const ['داشبورد', 'مشتریان', 'پروفایل مشتری'],
                      ),
                      BlocConsumer<UserShowCubit, UserShowState>(
                          builder: (context, state) {
                        if (state is UserShowLoading) {
                          return const Center(child: ProgressWidget());
                        } else if (state is UserShowLoaded) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildProfileRight(state.user),
                              const SizedBox(
                                width: spacingSmall,
                              ),
                              buildProfileLeft(state.user)
                            ],
                          );
                        } else if (state is UserShowError) {
                          print('request failed ${state.message}');
                          return ErrorResponseWidget(message: state.message);
                          ;
                        } else {
                          return Center(
                            child: Text(
                              'خطای بارگذاری',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          );
                        }
                      }, listener: (context, state) {
                        if (state is UserShowError) {
                          showToast(context: context, message: state.message);
                        }
                      })
                    ],
                  ),
                ),
              )),
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }

  Widget buildProfileInfoRow(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: spacingThin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).textTheme.headlineMedium?.color,
                size: 15,
              ),
              const SizedBox(width: 5),
              Text(label, style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget buildButtonsItems(
      {required String title, IconData? icon, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      leading: Icon(
        icon,
        size: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: smallRadius,
      ),
    );
  }

  Widget buildProfileRight(User user) {
    return Expanded(
        flex: 3,
        child: FormWidget(
            body: Column(
          children: [
            ImageDisplayWidget(
              imageUrl: user.image,
              size: 120,
              radius: 20,
              isShow: true,
            ),
            const SizedBox(height: spacingSmall),
            //Change image
            TextButton(
              onPressed: () {},
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
            Divider(
              height: 1,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(height: spacingThin),
            Column(
              children: [
                buildProfileInfoRow(
                    IconsaxPlusLinear.personalcard,
                    'نام و نام خانوادگی:',
                    '${user.first_name} ${user.last_name}'),
                buildProfileInfoRow(
                    IconsaxPlusLinear.mobile, 'شماره موبایل:', user.mobile!),
                buildProfileInfoRow(
                    IconsaxPlusLinear.message, 'ایمیل:', user.email!),
              ],
            ),
            const SizedBox(height: spacingThin),
            Divider(
              height: 1,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(height: spacingThin),
            buildButtonsItems(
              title: 'اطلاعات کاربری',
              icon: IconsaxPlusLinear.edit_2,
              onTap: () {},
            ),
            buildButtonsItems(
              title: 'امنیت و رمزعبور',
              icon: IconsaxPlusLinear.shield,
              onTap: () {},
            ),
            buildButtonsItems(
              title: 'سفارشات',
              icon: IconsaxPlusLinear.receipt_1,
              onTap: () {},
            ),
            buildButtonsItems(
              title: 'عملکرد',
              icon: IconsaxPlusLinear.activity,
              onTap: () {},
            ),
          ],
        )));
  }

  Widget buildProfileLeft(User user) {
    return Expanded(
      flex: 7,
      child: TabContainer(
        duration: const Duration(milliseconds: 300),
        tabEdge: TabEdge.top,
        tabCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        tabs: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconsaxPlusLinear.activity,
                size: 17,
              ),
              const SizedBox(width: 5,),
              Text('فعالیت ها', style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconsaxPlusLinear.shield,
                size: 17,
              ),
              const SizedBox(width: 5,),
              Text('امنیت و رمزعبور', style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconsaxPlusLinear.edit_2,
                size: 17,
              ),
              const SizedBox(width: 5,),
              Text('فعالیت ها', style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
        ],
        color: Theme.of(context).cardColor,
        children: [
          sectionActivity(),
          sectionSecurity(),
          sectionEdit(user),
        ],
      ),
    );
  }

  /// Sections
  // Edit
  Widget sectionEdit(User user) {
    _firstName.text = user.first_name!;
    _lastName.text = user.last_name!;
    _phone.text = user.mobile!;
    _telephone.text = user.telephone!;
    _email.text = user.email!;
    _nationalCode.text = user.national_code.toString();
    _sex = user.sex!;
    return Expanded(
        flex: 7,
        child: FormWidget(
          body: Column(
            children: [
              TableHeaderWidget(
                title: 'اطلاعات کاربری',
                endChildren: [
                  CommadbarWidget(
                    text: 'بروزرسانی',
                    icon: IconsaxPlusLinear.refresh_2,
                    onPressed: () {
                      context.read<AdminShowCubit>().show(1);
                    },
                  ),
                  /*BlocConsumer<UserUpdateCubit, UserUpdateState>(
                    listener: (context, state) {
                      if (state is UserUpdateError) {
                        showToast(context: context, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is UserUpdateLoading) {
                        return CommadbarWidget(
                          text: 'ویرایش',
                          icon: IconsaxPlusLinear.edit,
                          isLoading: true,
                        );
                      } else {
                        return CommadbarWidget(
                          text: 'ویرایش',
                          icon: IconsaxPlusLinear.edit,
                          onPressed: () {
                            final data = User(
                              id: admin.id,
                              first_name: _firstName.text,
                            );
                            context.read<AdminUpdateCubit>().update(data);
                          },
                        );
                      }
                    },
                  ),*/
                  CommadbarWidget(
                    text: 'حذف',
                    icon: IconsaxPlusLinear.trash,
                    iconColor: dangerColor,
                    textColor: dangerColor,
                    onPressed: () {},
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
                            const SizedBox(width: spacingThin),
                            Expanded(
                              child: TextFieldWidget(
                                controller: _lastName,
                                label: 'نام خانوادگی',
                              ),
                            ),
                            const SizedBox(width: spacingThin),
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
                            const SizedBox(width: spacingThin),
                            Expanded(
                              child: TextFieldWidget(
                                controller: _email,
                                label: 'ایمیل',
                              ),
                            ),
                            const SizedBox(width: spacingThin),
                            Expanded(
                                child: SpinnerWidget(
                              label: 'وضعیت',
                              items: const ['مرد', 'زن'],
                              selectedItem: _sex == 1 ? 'مرد' : 'زن',
                              onChanged: (p0) {
                                if (p0 == 'مرد') {
                                  _sex = 1;
                                } else {
                                  _sex = 0;
                                }
                              },
                            )),
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
                            const SizedBox(width: spacingThin),
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
        ));
  }

  // Security
  Widget sectionSecurity() {
    return Column(
      children: [Text('Secruity')],
    );
  }

  // Activity
  Widget sectionActivity() {
    return Column(
      children: [Text('Activity')],
    );
  }
}
