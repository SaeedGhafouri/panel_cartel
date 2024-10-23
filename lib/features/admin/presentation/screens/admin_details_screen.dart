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
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/error_response_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../data/models/admin_model.dart';
import '../../logic/cubit/update/admin_update_cubit.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const String routeName = '/adminDetails';
  final int? adminId;
  const AdminDetailsScreen({Key? key, this.adminId}) : super(key: key);
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
  late int _sex;
  @override
  void initState() {
    super.initState();
    context.read<AdminShowCubit>().show(1);
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
                        title: 'پروفایل کارشناس',
                        crumbs: const [
                          'داشبورد',
                          'کارشناسان',
                          'پروفایل کارشناس'
                        ],
                      ),
                      BlocConsumer<AdminShowCubit, AdminShowState>(
                          builder: (context, state) {
                            if (state is AdminShowLoading) {
                              return const Center(child: ProgressWidget());
                            } else if (state is AdminShowLoaded) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildProfileInfo(state.admin),
                                  const SizedBox(width: spacingSmall,),
                                  buildProfileForm(state.admin)
                                ],
                              );
                            } else if (state is AdminShowError) {
                              print('request failed ${state.message}');
                              return ErrorResponseWidget(message: state.message);;
                            } else {
                              return Center(
                                child: Text(
                                  'خطای بارگذاری',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
                            }
                          },
                          listener: (context, state) {})
                    ],
                  ),
                ),
              )),
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
  Widget buildProfileForm(Admin admin) {
    _firstName.text = admin.first_name!;
    _lastName.text = admin.last_name!;
    _phone.text = admin.mobile!;
    _telephone.text = admin.telephone!;
    _email.text = admin.email!;
    _nationalCode.text = admin.national_code.toString();
    _sex = admin.sex!;
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
                  BlocConsumer<AdminUpdateCubit, AdminUpdateState>(
                    listener: (context, state) {
                      if (state is AdminUpdateError) {
                        showToast(context: context, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is AdminUpdateLoading) {
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
                            final data = Admin(
                              id: admin.id,
                              first_name: _firstName.text,
                            );
                            context.read<AdminUpdateCubit>().update(data);
                          },
                        );
                      }
                    },
                  ),
                  CommadbarWidget(
                    text: 'حذف',
                    icon: IconsaxPlusLinear.trash,
                    iconColor: dangerColor,
                    textColor: dangerColor,
                    onPressed: () {

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
                              child:
                              TextFieldWidget(
                                controller:
                                _firstName,
                                label: 'نام',
                              ),
                            ),
                            const SizedBox(
                                width:
                                spacingThin),
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _lastName,
                                label:
                                'نام خانوادگی',
                              ),
                            ),
                            const SizedBox(
                                width:
                                spacingThin),
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _nationalCode,
                                label: 'کد ملی',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: spacingThin),
                        Row(
                          children: [
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _password,
                                label: 'رمز عبور',
                              ),
                            ),
                            const SizedBox(
                                width:
                                spacingThin),
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _email,
                                label: 'ایمیل',
                              ),
                            ),
                            const SizedBox(
                                width:
                                spacingThin),
                            Expanded(
                                child:
                                SpinnerWidget(
                                  label: 'وضعیت',
                                  items: const [
                                    'مرد',
                                    'زن'
                                  ],
                                  selectedItem:
                                  _sex == 1
                                      ? 'مرد'
                                      : 'زن',
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
                        const SizedBox(
                            height: spacingThin),
                        Row(
                          children: [
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _telephone,
                                label:
                                'تلفن ثابت',
                              ),
                            ),
                            const SizedBox(
                                width:
                                spacingThin),
                            Expanded(
                              child:
                              TextFieldWidget(
                                controller:
                                _phone,
                                label:
                                'شماره موبایل',
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
  Widget buildProfileInfo(Admin admin) {
    return Expanded(
      flex: 3,
      child: FormWidget(
        body: Column(
          children: [
            ImageDisplayWidget(
              imageUrl: admin.image,
            ),
            const SizedBox(height: spacingSmall),
            //Change image
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(IconsaxPlusLinear.edit,
                      size: 15,
                      color: grayIconColor),
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
            Divider(height: 1, color: Theme.of(context).dividerColor,),
            const SizedBox(height: spacingThin),
            Column(
              children: [
                buildProfileInfoRow(
                    IconsaxPlusLinear
                        .personalcard,
                    'نام و نام خانوادگی:',
                    '${admin.first_name} ${admin.last_name}'),
                buildProfileInfoRow(
                    IconsaxPlusLinear.mobile,
                    'شماره موبایل:',
                    admin.mobile!),
                buildProfileInfoRow(
                    IconsaxPlusLinear.message,
                    'ایمیل:',
                    admin.email!),
              ],
            ),
            const SizedBox(height: spacingThin),
            Divider(height: 1, color: Theme.of(context).dividerColor,),
            const SizedBox(height: spacingThin),
          ],
        ),
      ),
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
              Icon(icon, color: Theme.of(context).textTheme.headlineMedium?.color, size: 15,),
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
}
