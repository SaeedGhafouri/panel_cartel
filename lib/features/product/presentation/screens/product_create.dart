import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';
import '../../../../core/themes/themes.dart';

class ProductCreateScreen extends StatefulWidget {
  final double? productId;
  const ProductCreateScreen({super.key, this.productId});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _slug = TextEditingController();
  final TextEditingController _barcode = TextEditingController();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _brand_id = TextEditingController();
  final TextEditingController _category_id = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _gallery = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _is_special = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _sale_price = TextEditingController();
  final QuillController _controller = QuillController.basic();
  final TextEditingController _discount = TextEditingController();
  int status = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarMain(),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: containerHorizontal),
                  child: Column(
                    children: [
                      HeaderMain(
                        title: 'افزودن محصول',
                        crumbs: const [
                          'داشبورد',
                          'محصولات',
                          'افزودن محصول',
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 7, child: FormWidget(
                            body: Column(
                              children: [
                                const TableHeaderWidget(
                                  title: 'مشخصات',
                                ),
                                //01
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _name,
                                        label: 'نام محصول',
                                      ),
                                    ),
                                    const SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _slug,
                                        label: 'کلمه کلیدی',
                                      ),
                                    ),
                                    const SizedBox(width: spacingThin),
                                    Expanded(
                                      child: SpinnerWidget(
                                        label: 'وضعیت',
                                        items: const ['فعال', 'غیرفعال'],
                                        onChanged: (p0) {
                                          if(p0 == 'فعال') {
                                            status = 1;
                                          }else {
                                            status = 0;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: spacingThin),
                                //02
                                Row(
                                  children: [
                                    Expanded(
                                      child: SpinnerWidget(
                                        label: 'دسته بندی',
                                        items: const ['فعال', 'غیرفعال'],
                                        onChanged: (p0) {
                                          if(p0 == 'فعال') {
                                            status = 1;
                                          }else {
                                            status = 0;
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: spacingThin),
                                    Expanded(
                                      child: SpinnerWidget(
                                        label: 'برند',
                                        items: const ['فعال', 'غیرفعال'],
                                        onChanged: (p0) {
                                          if(p0 == 'فعال') {
                                            status = 1;
                                          }else {
                                            status = 0;
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: spacingThin),
                                    Expanded(
                                      child: TextFieldWidget(
                                        controller: _barcode,
                                        label: 'بارکد',
                                      ),
                                    ),
                                    const SizedBox(width: spacingThin),
                                    Expanded(
                                      child: SpinnerWidget(
                                        label: 'وضعیت',
                                        items: const ['فعال', 'غیرفعال'],
                                        onChanged: (p0) {
                                          if(p0 == 'فعال') {
                                            status = 1;
                                          }else {
                                            status = 0;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: spacingThin),
                                Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: smallRadius,
                                      border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                          style: BorderStyle.solid,
                                          width: 1
                                      ),
                                    ),
                                    child: Padding(
                                      padding: container,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "مشخصات فنی",
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                          const SizedBox(height: spacingThin,),
                                          QuillSimpleToolbar(
                                            controller: _controller,
                                            configurations: const QuillSimpleToolbarConfigurations(
                                              showListCheck: false,
                                              showSearchButton: false,
                                              showSuperscript: false,
                                              showSubscript: false,
                                              showStrikeThrough: false,
                                              showFontFamily: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: container,
                                            child: QuillEditor.basic(
                                              controller: _controller,
                                              configurations: const QuillEditorConfigurations(
                                                minHeight: 500,
                                                maxContentWidth: double.infinity,
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          )),
                          const SizedBox(width: spacingThin,),
                          const Expanded(flex: 3, child: Column(
                            children: [
                              FormWidget(
                                body: Column(
                                  children: [
                                    TableHeaderWidget(
                                      title: "تصاویر",
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: spacingThin,),
                              FormWidget(
                                body: Column(
                                  children: [
                                    TableHeaderWidget(
                                      title: "قیمت و موجودی",
                                    ),
                                    /*Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        //Main
                                        GestureDetector(
                                          onTap: _pickImageMain,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: _selectedImageMain == null ? Themes.backgroundColor : Colors.transparent,
                                              shape: BoxShape.rectangle,
                                              borderRadius: Themes.smallRadius,
                                              border: Border.all(
                                                color: Themes.gray500Color,
                                                style: BorderStyle.solid,
                                                width: 1,
                                              ),
                                            ),
                                            padding: Themes.padding_20,
                                            child: _selectedImageMain == null
                                                ? const Icon(
                                              Iconsax.gallery_add,
                                              size: 50,
                                              color: Themes.gray500Color,
                                            )
                                                : Image.memory(
                                              _selectedImageMain!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _pickImage01,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: _selectedImage01 == null ? Themes.backgroundColor : Colors.transparent,
                                              shape: BoxShape.rectangle,
                                              borderRadius: Themes.smallRadius,
                                              border: Border.all(
                                                color: Themes.gray500Color,
                                                style: BorderStyle.solid,
                                                width: 1,
                                              ),
                                            ),
                                            padding: Themes.padding_20,
                                            child: _selectedImage01 == null
                                                ? const Icon(
                                              Iconsax.gallery_add,
                                              size: 50,
                                              color: Themes.gray500Color,
                                            )
                                                : Image.memory(
                                              _selectedImage01!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _pickImage02,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: _selectedImage02 == null ? Themes.backgroundColor : Colors.transparent,
                                              shape: BoxShape.rectangle,
                                              borderRadius: Themes.smallRadius,
                                              border: Border.all(
                                                color: Themes.gray500Color,
                                                style: BorderStyle.solid,
                                                width: 1,
                                              ),
                                            ),
                                            padding: Themes.padding_20,
                                            child: _selectedImage02 == null
                                                ? const Icon(
                                              Iconsax.gallery_add,
                                              size: 50,
                                              color: Themes.gray500Color,
                                            )
                                                : Image.memory(
                                              _selectedImage02!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _pickImage03,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: _selectedImage03 == null ? Themes.backgroundColor : Colors.transparent,
                                              shape: BoxShape.rectangle,
                                              borderRadius: Themes.smallRadius,
                                              border: Border.all(
                                                color: Themes.gray500Color,
                                                style: BorderStyle.solid,
                                                width: 1,
                                              ),
                                            ),
                                            padding: Themes.padding_20,
                                            child: _selectedImage03 == null
                                                ? const Icon(
                                              Iconsax.gallery_add,
                                              size: 50,
                                              color: Themes.gray500Color,
                                            )
                                                : Image.memory(
                                              _selectedImage03!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),*/
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              )
          ),

        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
