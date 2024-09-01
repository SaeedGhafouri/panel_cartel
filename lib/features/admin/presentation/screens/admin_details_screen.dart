import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/commadbar_main.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/features/admin/logic/cubit/admin_state.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/card_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../logic/cubit/admin_cubit.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const String routeName = '/adminDetails';
  final double? adminId;
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
    // TODO: implement initState
    super.initState();
    context.read<AdminCubit>().fetchAdminDetail(widget.adminId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarMain(),
          Directionality(
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
                      BlocConsumer<AdminCubit, AdminState>(
                          builder: (context, state) {
                            if (state is AdminLoading) {
                              return Center(child: ProgressWidget());
                            } else if (state is AdminDetailLoaded) {
                              _firstName.text = state.admin.first_name!;
                              _lastName.text = state.admin.last_name!;
                              //_password.text = state.data.password!;
                              _phone.text = state.admin.mobile!;
                              _telephone.text = state.admin.telephone!;
                              _email.text = state.admin.email!;
                              _nationalCode.text = state.admin.national_code!;
                              _sex = state.admin.sex!;
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: FormWidget(
                                      body: Column(
                                        children: [
                                          ImageDisplayWidget(
                                            imageUrl: state.admin.image,
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
                                                    fontFamily:
                                                    font_regular,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: spacingThin),
                                          const Divider(
                                              height: 1,
                                              color: grayDividerColor),
                                          const SizedBox(height: spacingThin),
                                          Column(
                                            children: [
                                              buildProfileInfoRow(
                                                  IconsaxPlusLinear
                                                      .personalcard,
                                                  'نام و نام خانوادگی:',
                                                  '${state.admin.first_name} ${state.admin.last_name}'),
                                              buildProfileInfoRow(
                                                  IconsaxPlusLinear.mobile,
                                                  'شماره موبایل:',
                                                  state.admin.mobile!),
                                              buildProfileInfoRow(
                                                  IconsaxPlusLinear.message,
                                                  'ایمیل:',
                                                  state.admin.email!),
                                            ],
                                          ),
                                          const SizedBox(height: spacingThin),
                                          const Divider(
                                              height: 1,
                                              color: grayDividerColor),
                                          const SizedBox(height: spacingThin),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: spacingSmall,
                                  ),
                                  Expanded(
                                      flex: 7,
                                      child: FormWidget(
                                        body: Column(
                                          children: [
                                            TableHeaderWidget(
                                              title: 'اطلاعات کاربری',
                                              endChildren: [
                                                CommadbarWidget(
                                                  text: 'ویرایش',
                                                  icon: IconsaxPlusLinear.edit,
                                                  onPressed: () {
                                                    /*final data = Admin(
                                                  id: 3,
                                                  firstName: _firstName.text,
                                                  lastName: _lastName.text,
                                                  email: _email.text,
                                                  mobile: _phone.text,
                                                  nationalCode: _nationalCode.text,
                                                  telephone: _telephone.text,
                                                  sex: _sex,
                                                  status: 1,
                                                );
                                                context.read<AdminBloc>().add(UpdateAdmin(data));*/
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
                                                            child:
                                                                TextFieldWidget(
                                                              controller:
                                                                  _firstName,
                                                              label: 'نام',
                                                            ),
                                                          ),
                                                          SizedBox(
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
                                                          SizedBox(
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
                                                          SizedBox(
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
                                                          SizedBox(
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
                                                          SizedBox(
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
                                      ))
                                ],
                              );
                            } else if (state is AdminError) {
                              return Center(
                                child: Text(
                                  state.message,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              );
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

  Widget buildProfileInfoRow(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: spacingThin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: grayIconColor, size: 15),
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
