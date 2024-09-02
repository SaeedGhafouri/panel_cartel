import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';
import '../../../../core/constants/assets.dart';
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
          AppBarMain(),
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
                      FormWidget(
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
                                SizedBox(width: spacingThin),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _slug,
                                    label: 'کلمه کلیدی',
                                  ),
                                ),
                                SizedBox(width: spacingThin),
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
                                SizedBox(width: spacingThin),
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
                                SizedBox(width: spacingThin),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _barcode,
                                    label: 'بارکد',
                                  ),
                                ),
                                SizedBox(width: spacingThin),
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
                                      SizedBox(height: spacingThin,),
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
                      )
                    ],
                  ),
                ),
              )
          ),

        ],
      ),
      endDrawer: SideDrawer(),
    );
  }
}
