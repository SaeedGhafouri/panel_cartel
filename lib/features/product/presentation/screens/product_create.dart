import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
  final String routeName = '/productCreate';
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
  String quantityType = 'مبلغ';
  List<TextInputFormatter> inputFormatters = [FilteringTextInputFormatter.digitsOnly];
  int status = 1;

  void _onQuantityTypeChanged(String? value) {
    setState(() {
      _discount.clear();
      quantityType = value!;
      if (quantityType == 'درصد') {
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp(r'^(100|[1-9]?\d)$')),
        ];
      } else {
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      }
    });
  }

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
                          Expanded(flex: 3, child: Column(
                            children: [
                              FormWidget(
                                body: Column(
                                  children: [
                                    TableHeaderWidget(
                                      title: "تصاویر",
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: 6,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: smallRadius,
                                            border: Border.all(
                                              color: Theme.of(context).dividerColor,
                                              style: BorderStyle.solid,
                                              width: 1
                                            ),
                                          ),
                                          child:  Icon(IconsaxPlusLinear.gallery, color: Theme.of(context).iconTheme.color!.withOpacity(0.2), size: 50,)
                                        );
                                      },
                                    ),
                                    SizedBox(height: spacingThin,),
                                    Text(
                                      'حداکثر حجم تصویر 500 کیلوبایت',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: spacingThin,),
                              FormWidget(
                                body: Column(
                                  children: [
                                    const TableHeaderWidget(
                                      title: "قیمت و موجودی",
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFieldWidget(
                                            controller: _price,
                                            label: 'قیمت اصلی',
                                            inputType: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                          child: TextFieldWidget(
                                            controller: _sale_price,
                                            label: 'قیمت فروش',
                                            inputType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: spacingThin),
                                    Row(
                                      children: [
                                        //Qantity
                                        Expanded(
                                          child: TextFieldWidget(
                                            controller: _quantity,
                                            label: 'موجودی',
                                            inputType: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(width: spacingThin),
                                        //Type
                                        Expanded(
                                          child: SpinnerWidget(
                                            label: 'نوع بسته',
                                            items: const ['عدد', 'بسته', 'کارتن', 'شیرینگ', 'کیسه', 'پالت', 'کلاف', 'قوطی', 'جعبه'],
                                            onChanged: (p0) {
                                              //quantityType = p0.toString();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: spacingSmall),
                                    Divider(
                                      height: 1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    SizedBox(height: spacingSmall),
                                    //Discount
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "تخفیف",
                                          style: TextStyle(
                                            fontSize: txt_30,
                                            fontFamily: font_medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: spacingThin),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SpinnerWidget(
                                            label: 'نوع تخفیف',
                                            items: const ['مبلغ', 'درصد'],
                                            onChanged: _onQuantityTypeChanged,
                                          ),
                                        ),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                          child: TextFieldWidget(
                                            controller: _discount,
                                            label: 'مقدار تخفیف',
                                            inputFormatters: inputFormatters,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: spacingSmall),
                                    //Main Price
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              'قیمت واحد',
                                              style: Theme.of(context).textTheme.headlineMedium,
                                            )),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _price.text,
                                                  textDirection: TextDirection.ltr,
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  'ریال ',
                                                  textDirection: TextDirection.ltr,
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    /*SizedBox(height: spacingThin),
                                    //Tax
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              'مالیات',
                                              style: TextStyle(
                                                  fontSize: txt_20,
                                                  fontFamily: font_medium,
                                                  color: grayTextColor),
                                            )),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '146,000',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_40,
                                                      fontFamily: font_medium,
                                                      color: darkTextColor),
                                                ),
                                                Text(
                                                  'ریال ',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_30,
                                                      fontFamily: font_medium,
                                                      color: grayTextColor),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),*/
                                    SizedBox(height: spacingThin),
                                    //Discount
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              'تخفیف',
                                              style: TextStyle(
                                                  fontSize: txt_20,
                                                  fontFamily: font_medium,
                                                  color: grayTextColor),
                                            )),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '146,000',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_40,
                                                      fontFamily: font_medium,
                                                      color: dangerColor),
                                                ),
                                                Text(
                                                  'ریال ',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_30,
                                                      fontFamily: font_medium,
                                                      color: grayTextColor),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: spacingThin),
                                    //Total price
                                    const Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              'قیمت نهایی',
                                              style: TextStyle(
                                                  fontSize: txt_20,
                                                  fontFamily: font_medium,
                                                  color: grayTextColor),
                                            )),
                                        SizedBox(width: spacingThin),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '147,216,000',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_50,
                                                      fontFamily: font_medium,
                                                      color: successColor),
                                                ),
                                                Text(
                                                  'ریال ',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontSize: txt_30,
                                                      fontFamily: font_medium,
                                                      color: grayTextColor),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
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
