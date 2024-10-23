import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/utils/app_routes.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/map_picker_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:panel_cartel/core/widgets/gender_spinner_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/status_switch_widget.dart';
import 'package:panel_cartel/features/admin/presentation/widgets/role_dropdown_widget.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../data/models/admin_model.dart';
import '../../logic/cubit/create/admin_create_cubit.dart';

class AdminCreateScreen extends StatefulWidget {
  static String routeName = 'adminCreate';
  const AdminCreateScreen({Key? key}) : super(key: key);

  @override
  _AdminCreateScreenState createState() => _AdminCreateScreenState();
}

class _AdminCreateScreenState extends State<AdminCreateScreen> {
  //Person
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nationalCode = TextEditingController();
  final int _sex = 1;
  late int _status = 1;
  late int _roleId = 0;

  //Address
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _region = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _alley = TextEditingController();
  final TextEditingController _plaque = TextEditingController();
  final TextEditingController _lat = TextEditingController();
  final TextEditingController _lng = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _completeAddress = TextEditingController();

  Uint8List? _selectedImageMain;

  Future<void> _pickImageMain() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImageMain = result.files.single.bytes!;
      });
    }
  }

  Map<String, String?> _errors = {};

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _password.dispose();
    _phone.dispose();
    _telephone.dispose();
    _email.dispose();
    _nationalCode.dispose();
    _country.dispose();
    _state.dispose();
    _city.dispose();
    _region.dispose();
    _street.dispose();
    _alley.dispose();
    _plaque.dispose();
    _lat.dispose();
    _lng.dispose();
    _description.dispose();
    _completeAddress.dispose();
    super.dispose();
  }

  Map<String, String> _validateForm() {
    final Map<String, String> errors = {};

    if (_firstName.text.isEmpty) {
      errors['firstName'] = 'نام الزامی است';
    }

    if (_lastName.text.isEmpty) {
      errors['lastName'] = 'نام خانوادگی الزامی است';
    }

    if (_phone.text.isEmpty) {
      errors['phone'] = 'شماره موبایل الزامی است';
    }

    if (_email.text.isEmpty || !_email.text.contains('@')) {
      errors['email'] = 'ایمیل معتبر نیست';
    }

    if (_nationalCode.text.isEmpty) {
      errors['nationalCode'] = 'کد ملی الزامی است';
    }

    if (_password.text.isEmpty) {
      errors['password'] = 'رمز عبور الزامی است';
    }

    setState(() {
      _errors = errors;
    });

    return errors;
  }

  void _submit() {
    final errors = _validateForm();

    if (errors.isNotEmpty) {
      print('Error isnotempty');
      return;
    }

    final admin = Admin(
      first_name: _firstName.text,
      last_name: _lastName.text,
      mobile: _phone.text,
      email: _email.text,
      password: _password.text,
      sex: _sex,
      status: _status,
      national_code: int.parse(_nationalCode.text.trim()),
      telephone: _telephone.text,
      image: _selectedImageMain != null ? base64Encode(_selectedImageMain!) : null,
      role_id: _roleId,
    );
    print('start');
    context.read<AdminCreateCubit>().create(admin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const AppBarMain(),
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: containerHorizontal),
                  child: Column(
                    children: [
                      HeaderMain(
                        title: 'افزودن کارشناس',
                        crumbs: const ['داشبورد', 'کارشناسان'],
                      ),
                      FormWidget(
                        body: Column(
                          children: [
                            TableHeaderWidget(
                              title: 'اطلاعات کاربری',
                              endChildren: [
                                CommadbarWidget(
                                  text: 'مشاهده لیست',
                                  icon: Icons.people,
                                  onPressed: () {
                                    context.go(AppRoutes.admins);
                                  },
                                ),
                                CommadbarWidget(
                                  text: 'نقش ها و دسترسی ها',
                                  icon: IconsaxPlusLinear.lock_1,
                                  onPressed: () {
                                    context.go('${AppRoutes.admins}/${AppRoutes.adminRoles}');
                                  },
                                ),
                                BlocConsumer<AdminCreateCubit, AdminCreateState>(
                                    builder: (context, state) {
                                      if (state is AdminCreateLoading) {
                                        return const ProgressWidget();
                                      } else {
                                        return CommadbarWidget(
                                          text: 'تایید و ذخیره',
                                          background: Theme.of(context).primaryColor,
                                          textColor: Colors.white,
                                          icon: Icons.check,
                                          iconColor: Colors.white,
                                          onPressed: _submit,
                                        );
                                      }
                                    },
                                    listener: (context, state) {
                                      if (state is AdminCreateSuccess) {
                                        showToast(context: context, message: 'کاربر با موفقیت اضافه شد', type: ToastType.success);
                                        context.go(AppRoutes.admins);
                                      } else if (state is AdminCreateFailure) {
                                        showToast(context: context, message: state.message);
                                      }
                                    }
                                )
                              ],
                            ),
                            /// Information
                            Row(
                              children: [
                                ImagePickerWidget(
                                  label: 'تصویر کارشناس',
                                  onImageSelected: (Uint8List? image) {
                                    if (image != null) {
                                      print("تصویر برای سرور آماده است");
                                    }
                                  },
                                ),
                                const SizedBox(width: 8.0),
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
                                              maxLength: 35,
                                              errorText: _errors['firstName'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _lastName,
                                              label: 'نام خانوادگی',
                                              maxLength: 35,
                                              errorText: _errors['lastName'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _nationalCode,
                                              label: 'کد ملی',
                                              maxLength: 10,
                                              errorText:
                                                  _errors['nationalCode'],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _password,
                                              label: 'رمز عبور',
                                              maxLength: 32,
                                              isPassword: true,
                                              inputType:
                                                  TextInputType.visiblePassword,
                                              errorText: _errors['password'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _email,
                                              maxLength: 50,
                                              label: 'ایمیل',
                                              errorText: _errors['email'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: GenderSpinnerWidget(
                                                /*errorText: _errors['sex']*/)
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: TextFieldWidget(
                                              controller: _telephone,
                                              maxLength: 15,
                                              label: 'تلفن ثابت',
                                              errorText: _errors['telephone'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            flex: 2,
                                            child: TextFieldWidget(
                                              controller: _phone,
                                              maxLength: 11,
                                              label: 'شماره موبایل',
                                              errorText: _errors['phone'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            flex: 2,
                                            child: RoleDropdownWidget(
                                              onChanged: (p0) {
                                                _roleId = p0;
                                              },
                                            )

                                          ),
                                          const SizedBox(width: 8.0),
                                          StatusSwitchWidget(
                                            onToggle: (p0) {
                                              _status = p0;
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            /// Address
                            const TableHeaderWidget(
                              title: 'آدرس محل سکونت',
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _country,
                                              label: 'کشور',
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _state,
                                              label: 'استان',
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _city,
                                              label: 'شهرستان / روستا',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _region,
                                              label: 'منطقه',
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _street,
                                              label: 'خیابان',
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _alley,
                                              label: 'کوچه',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _plaque,
                                              label: 'پلاک',
                                            ),
                                          ),

                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _description,
                                              label: 'توضیحات',
                                            ),
                                          ),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  flex: 4,
                                  child: MapPickerWidget(onLocationSelected: (location) {
                                    print(location);
                                  }
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      endDrawer: const SideDrawer(),
    );
  }
}