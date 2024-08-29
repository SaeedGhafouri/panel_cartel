
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/dialogs/validate_form_dialog.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/form_main.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../data/models/admin.dart';
import '../bloc/admin_bloc.dart';

class AdminCreateScreen extends StatefulWidget {
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
  final TextEditingController _sex = TextEditingController();
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
  final TextEditingController _complete_address = TextEditingController();
  late int? sexChoice;
  Uint8List? _selectedImageMain;
  Future<void> _pickImageMain() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImageMain = result.files.single.bytes!;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sex.text = '';
    sexChoice = int.tryParse(_sex.text);
    sexChoice = 0;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _password.dispose();
    _phone.dispose();
    _telephone.dispose();
    _email.dispose();
    _nationalCode.dispose();
    _sex.dispose();
    //Address
    _country.dispose();
    _state.dispose();
    _city.dispose();
    _region.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map<String, String> _validateForm() {
      final Map<String, String> errors = {};

      if (_firstName.text.isEmpty) {
        errors['firstName'] = 'نام';
      }

      if (_lastName.text.isEmpty) {
        errors['lastName'] = 'نام خانوادگی';
      }

      if (_phone.text.isEmpty) {
        errors['phone'] = 'شماره موبایل';
      }

      if (_telephone.text.isEmpty) {
        errors['telephone'] = 'شماره تلفن ثابت';
      }

      if (_email.text.isEmpty || !_email.text.contains('@')) {
        errors['email'] = 'ایمیل معتبر';
      }

      if (_nationalCode.text.isEmpty) {
        errors['nationalCode'] = 'کد ملی';
      }

      if (_password.text.isEmpty) {
        errors['password'] = 'رمز عبور';
      }

      if (sexChoice == null) {
        errors['sex'] = 'انتخاب جنسیت';
      }

      return errors;
    }
    void _submit() {
      final errors = _validateForm();

      if (errors.isNotEmpty) {
        ValidateFormDialog.show(context, errors);
        return;
      }

      final admin = Admin(
        id: 0,
        firstName: _firstName.text,
        lastName: _lastName.text,
        mobile: _phone.text,
        email: _email.text,
        sex: sexChoice!,
        status: 1,
        nationalCode: _nationalCode.text,
        telephone: _telephone.text,
        image: _selectedImageMain != null ? base64Encode(_selectedImageMain!) : null,
      );
      context.read<AdminBloc>().add(CreateAdmin(admin));
    }

    return Scaffold(
        body: Directionality(textDirection: TextDirection.rtl, child: SingleChildScrollView(
            child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: container,
                margin: container,
                child: Column(
                    children: [
                      HeaderMain(
                          title: 'افزودن کارشناس',
                          crumbs: const [
                            'داشبورد',
                            'کارشناسان'
                          ]
                      ),
                      FormMain(
                          body: Column(
                              children: [
                                TableHeaderWidget(
                                  title: 'اطلاعات کاربری',
                                  endChildren: [
                                    CommadbarWidget(
                                      text: 'مشاهده لیست',
                                      icon: IconsaxPlusLinear.people,
                                      onPressed: () {
                                        //TODO: Add Admin
                                      },
                                    ),
                                    CommadbarWidget(
                                      text: 'تایید و ذخیره',
                                      background: Theme.of(context).primaryColor,
                                      textColor: Colors.white,
                                      icon: IconsaxPlusLinear.tick_square,
                                      iconColor: Colors.white,
                                      onPressed: () {
                                        _submit();
                                      },
                                    ),
                                  ],
                                ),
                                //Person
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: _pickImageMain,
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: _selectedImageMain == null ? backgroundColor : Colors.transparent,
                                            shape: BoxShape.rectangle,
                                            borderRadius: smallRadius,
                                            border: Border.all(
                                              color: Theme.of(context).dividerColor,
                                              style: BorderStyle.solid,
                                              width: 2,
                                            ),
                                          ),
                                          padding: padding_20,
                                          child: _selectedImageMain == null
                                              ?  Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconsaxPlusLinear.gallery_add,
                                                size: 50,
                                                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.2),
                                              ),
                                              SizedBox(height: 10,),
                                              Text(
                                                'تصویر کارشناس',
                                                style: TextStyle(
                                                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.2),
                                                  fontFamily: font_medium,
                                                  fontSize: txt_20,
                                                ),
                                              )
                                            ],
                                          )
                                              : Image.memory(
                                            _selectedImageMain!,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: spacingThin,),
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
                                    )
                                  ],
                                ),
                                const SizedBox(height: spacingSmall),
                                //Address
                                const TableHeaderWidget(
                                  title: 'آدرس محل سکونت',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _country,
                                        label: 'کشور',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _state,
                                        label: 'استان',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _city,
                                        label: 'شهرستان / روستا',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _region,
                                        label: 'منطقه',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: spacingThin),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _street,
                                        label: 'خیابان',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _alley,
                                        label: 'کوچه',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _plaque,
                                        label: 'پلاک',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: spacingThin),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _description,
                                        label: 'توضیحات',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _lng,
                                        label: 'طول',
                                      ),
                                    ),
                                    SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _lat,
                                        label: 'عرض',
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          )
                      )
                    ]
                )
            )
        ))
    );
  }
}

