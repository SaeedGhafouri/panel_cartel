
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/commadbar_main.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/card_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../data/models/admin.dart';
import '../../data/repositories/admin_repository.dart';
import '../bloc/admin_bloc.dart';

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
  late int _sex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminBloc(AdminRepository())..add(GetAdminDetails(3)),
      child: Scaffold(
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
                    BlocBuilder<AdminBloc, AdminState>(
                      builder: (context, state) {
                        if (state is AdminLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if(state is AdminError){
                          return Center(child: Text(state.message));
                        } else if (state is AdminDetailsLoaded) {
                          _firstName.text = state.data.firstName!;
                          _lastName.text = state.data.lastName!;
                          //_password.text = state.data.password!;
                          _phone.text = state.data.mobile!;
                          _telephone.text = state.data.telephone!;
                          _email.text = state.data.email!;
                          _nationalCode.text = state.data.nationalCode!;
                          _sex = state.data.sex!;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: FormMain(
                                  body: Column(
                                    children: [
                                      ImageDisplayWidget(
                                        imageUrl: state.data.image,
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
                                              IconsaxPlusLinear.personalcard, 'نام و نام خانوادگی:', '${state.data.firstName} ${state.data.lastName}'),
                                          buildProfileInfoRow(IconsaxPlusLinear.mobile, 'شماره موبایل:', state.data.mobile!),
                                          buildProfileInfoRow(
                                              IconsaxPlusLinear.message, 'ایمیل:', state.data.email!),
                                        ],
                                      ),
                                      const SizedBox(height: spacingThin),
                                      const Divider(height: 1, color: grayDividerColor),
                                      const SizedBox(height: spacingThin),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: spacingSmall,),
                              Expanded(
                                  flex: 7,
                                  child: FormMain(
                                    body: Column(
                                      children: [
                                        TableHeaderWidget(
                                          title: 'اطلاعات کاربری',
                                          endChildren: [
                                            CommadbarWidget(
                                              text: 'ویرایش',
                                              icon: IconsaxPlusLinear.edit,
                                              onPressed: () {
                                                final data = Admin(
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
                                                context.read<AdminBloc>().add(UpdateAdmin(data));
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
                                                        child: SpinnerWidget(
                                                          label: 'وضعیت',
                                                          items: const ['مرد', 'زن'],
                                                          selectedItem: _sex == 1 ? 'مرد' : 'زن',
                                                          onChanged: (p0) {
                                                            if(p0 == 'مرد') {
                                                              _sex = 1;
                                                            }else {
                                                              _sex = 0;
                                                            }
                                                          },
                                                        )
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
                          );
                        } else {
                          return Container();
                        }
                      }
                    )
                  ],
                ),
              ),
            )
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
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: font_regular,
              fontSize: txt_30,
              color: darkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}