import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/dialogs/brands_dialog.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/checkbox_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/dialogs/category_dialog.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../data/models/product_model.dart';
import '../../logic/cubit/product_cubit.dart';

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
  final TextEditingController _description = TextEditingController();
  final TextEditingController _is_special = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _sale_price = TextEditingController();
  final QuillController _controller = QuillController.basic();
  final TextEditingController _discount = TextEditingController();
  final ValueNotifier<String> categoryTxt = ValueNotifier<String>('دسته بندی');
  final ValueNotifier<String> brandTxt = ValueNotifier<String>('برند');

  String _discountType = 'مبلغ';
  double _finalPrice = 0.0;
  double _discountValue = 0.0;
  List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.digitsOnly
  ];
  int status = 1;

  List<Uint8List?> selectedImages = List.generate(6, (_) => null);

  Future<void> _pickImage(int index) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
        allowMultiple: false,
      );

      if (result != null) {
        Uint8List? fileBytes = result.files.single.bytes;
        if (fileBytes != null && fileBytes.length <= 500 * 1024) {
          // بررسی حجم فایل
          setState(() {
            selectedImages[index] = fileBytes;
          });
        } else {
          showToast(
              context: context,
              message: 'حجم تصویر باید کمتر از 500 کیلوبایت باشد',
              type: ToastType.error);
        }
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  bool _isActive = false;

  void _onQuantityTypeChanged(String? value) {
    _updatePrice();
    setState(() {
      _discount.clear();
      _discountType = value!;
      if (_discountType == 'درصد') {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.addListener(() {
      final nameText = _name.text;
      final slugText = nameText.replaceAll(' ', '-');
      _slug.text = slugText;
    });
    _sale_price.addListener(() {
      _updatePrice();
    });

    _discount.addListener(() {
      _updatePrice();
    });
  }

  void _updatePrice() {
    double salePrice = double.tryParse(_sale_price.text) ?? 0.0;
    double discountValue = double.tryParse(_discount.text) ?? 0.0;

    _price.text = _sale_price.text;

    if (_discountType == 'درصد') {
      _finalPrice = salePrice - (salePrice * discountValue / 100);
      _discountValue = double.parse((_discountValue).toStringAsFixed(2));
    } else {
      _finalPrice = salePrice - discountValue;
    }

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _name.dispose();
    _slug.dispose();
    _barcode.dispose();
    _status.dispose();
    _brand_id.dispose();
    _category_id.dispose();
    _image.dispose();
    _description.dispose();
    _is_special.dispose();
    _quantity.dispose();
    _price.dispose();
    _sale_price.dispose();
    _discount.dispose();
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: containerHorizontal),
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
                          Expanded(
                              flex: 7,
                              child: FormWidget(
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
                                          child: TextFieldWidget(
                                            controller: _barcode,
                                            label: 'بارکد',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: spacingThin),
                                    //02
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ValueListenableBuilder<String>(
                                            valueListenable: categoryTxt,
                                            builder: (context, value, child) {
                                              return ButtonWidget(
                                                icon:
                                                    IconsaxPlusLinear.category,
                                                text: value,
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CategoryDialog(
                                                        onSelected: (int id,
                                                            String name) {
                                                          categoryTxt.value =
                                                              name;
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: spacingThin),
                                        Expanded(
                                          child: ValueListenableBuilder<String>(
                                            valueListenable: brandTxt,
                                            builder: (context, value, child) {
                                              return ButtonWidget(
                                                icon:
                                                    IconsaxPlusLinear.ticket_2,
                                                text: value,
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return BrandsDialog(
                                                        onBrandSelected:
                                                            (int id,
                                                                String name) {
                                                          brandTxt.value = name;
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: spacingThin),
                                        ToggleSwitch(
                                          minWidth: 80.0,
                                          minHeight: heightCmdBrMain,
                                          cornerRadius: radiusSmall,
                                          radiusStyle: true,
                                          animationDuration: 300,
                                          animate: true,
                                          activeFgColor: Colors.white,
                                          inactiveFgColor:
                                              Theme.of(context).dividerColor,
                                          inactiveBgColor: Theme.of(context)
                                              .dividerColor
                                              .withOpacity(0.5),
                                          totalSwitches: 2,
                                          labels: ['فعال', 'غیرفعال'],
                                          customTextStyles: [
                                            const TextStyle(fontSize: 12),
                                            const TextStyle(fontSize: 12),
                                          ],
                                          onToggle: (index) {},
                                        ),
                                        const SizedBox(width: spacingThin),
                                        CheckboxWidget(
                                          label: 'پیشنهادی',
                                          value: _isActive,
                                          onChanged: (value) {
                                            setState(() {
                                              _isActive = value!;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: spacingThin),
                                    Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: smallRadius,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .dividerColor,
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: container,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "مشخصات فنی",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              const SizedBox(
                                                height: spacingThin,
                                              ),
                                              QuillSimpleToolbar(
                                                controller: _controller,
                                                configurations:
                                                    const QuillSimpleToolbarConfigurations(
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
                                                  configurations:
                                                      const QuillEditorConfigurations(
                                                    minHeight: 500,
                                                    maxContentWidth:
                                                        double.infinity,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          const SizedBox(
                            width: spacingThin,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  /// TODO Images
                                  FormWidget(
                                    body: Column(
                                      children: [
                                        TableHeaderWidget(
                                          title: "تصاویر",
                                        ),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: selectedImages.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 2,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () => _pickImage(index),
                                              child: Container(
                                                margin: const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: smallRadius,
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                    style: BorderStyle.solid,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: selectedImages[index] !=
                                                        null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            smallRadius,
                                                        child: Image.memory(
                                                          selectedImages[
                                                              index]!,
                                                          fit: BoxFit.cover,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                        ),
                                                      )
                                                    : Icon(
                                                        IconsaxPlusLinear
                                                            .gallery,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color!
                                                            .withOpacity(0.2),
                                                        size: 50,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: spacingThin,
                                        ),
                                        Text(
                                          'حداکثر حجم تصویر 500 کیلوبایت',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: spacingThin,
                                  ),

                                  /// TODO Price
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
                                                label: 'قیمت واحد',
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
                                            Expanded(
                                              child: SpinnerWidget(
                                                label: 'نوع تخفیف',
                                                items: const ['مبلغ', 'درصد'],
                                                onChanged: (value) {
                                                  setState(() {
                                                    _discountType = value!;
                                                    _updatePrice();
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _discount,
                                                label: 'مقدار تخفیف',
                                                inputType: TextInputType.number,
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
                                        //Main Price
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'قیمت واحد',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            )),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _price.text,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                Text(
                                                  'ریال ',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: spacingThin),
                                        //Discount
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'تخفیف',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            )),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _discountValue
                                                      .toStringAsFixed(2),
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          color: Colors.red),
                                                ),
                                                Text(
                                                  _discountType == 'درصد'
                                                      ? '% '
                                                      : ' ریال ',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: spacingThin),
                                        //Total price
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'قیمت نهایی',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            )),
                                            SizedBox(width: spacingThin),
                                            Expanded(
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  _finalPrice
                                                      .toStringAsFixed(0),
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          color: Colors.green),
                                                ),
                                                Text(
                                                  ' ریال ',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: spacingThin),
                                        //Bloc costomer btn

                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
