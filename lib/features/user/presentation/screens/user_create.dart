

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';

import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';

class UserCreateScreen extends StatefulWidget {
  const UserCreateScreen({super.key});

  @override
  State<UserCreateScreen> createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen> {


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
  final TextEditingController _completeAddress = TextEditingController();

  Uint8List? _selectedImageMain;

  Future<void> _pickImageMain() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImageMain = result.files.single.bytes! as Uint8List?;
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
    _sex.dispose();
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

    if (_telephone.text.isEmpty) {
      errors['telephone'] = 'شماره تلفن ثابت الزامی است';
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
      return;
    }

    /*final admin = Admin(
      id: 0,
      first_name: _firstName.text,
      last_name: _lastName.text,
      mobile: _phone.text,
      email: _email.text,
      sex: int.tryParse(_sex.text) ?? 0,
      status: 1,
      national_code: int.parse(_nationalCode.text),
      telephone: _telephone.text,
      image: _selectedImageMain != null ? base64Encode(_selectedImageMain!) : null,
    );

    context.read<AdminCubit>().createAdmin(admin);*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              AppBarMain(),
              Expanded(
                child:  SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: containerHorizontal),
                  child: Column(
                    children: [
                      HeaderMain(
                        title: 'ایجاد مشتری جدید',
                        crumbs: const [
                          'داشبورد',
                          'مدیریت مشتریان',
                          'ایجاد مشتری جدید'
                        ],
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
                                    // TODO: نمایش لیست ادمین‌ها
                                  },
                                ),
                                CommadbarWidget(
                                  text: 'تایید و ذخیره',
                                  background: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  icon: Icons.check,
                                  iconColor: Colors.white,
                                  onPressed: _submit,  // فراخوانی تابع _submit
                                ),
                              ],
                            ),
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
                                        color: _selectedImageMain == null ? Colors.grey[200] : Colors.transparent,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(20.0),
                                      child: _selectedImageMain == null
                                          ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_library,
                                            size: 50,
                                            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.2),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'تصویر کارشناس',
                                            style: TextStyle(
                                              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.2),
                                              fontFamily: 'Medium',
                                              fontSize: 20,
                                            ),
                                          ),
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
                                              errorText: _errors['firstName'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _lastName,
                                              label: 'نام خانوادگی',
                                              errorText: _errors['lastName'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _nationalCode,
                                              label: 'کد ملی',
                                              errorText: _errors['nationalCode'],
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
                                              inputType: TextInputType.visiblePassword,
                                              errorText: _errors['password'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _email,
                                              label: 'ایمیل',
                                              errorText: _errors['email'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _sex,
                                              label: 'جنسیت',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _telephone,
                                              label: 'تلفن ثابت',
                                              errorText: _errors['telephone'],
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: _phone,
                                              label: 'شماره موبایل',
                                              errorText: _errors['phone'],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
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
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _region,
                                    label: 'منطقه',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
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
                                const SizedBox(width: 8.0),
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
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _lng,
                                    label: 'طول',
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _lat,
                                    label: 'عرض',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
