import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/dialogs/brands_dialog.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/button_popup_widget.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/checkbox_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/dialogs/category_dialog.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/form_validator.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../data/models/product_model.dart';
import '../../logic/cubit/barcode_cubit.dart';
import '../../logic/cubit/create/product_create_cubit.dart';

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
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _sale_price = TextEditingController();
  final QuillController _controller = QuillController.basic();
  final TextEditingController _discount = TextEditingController();
  final ValueNotifier<String> categoryTxt = ValueNotifier<String>('دسته بندی');
  late final int categoryId;
  final ValueNotifier<String> brandTxt = ValueNotifier<String>('برند');
  late final int brandId;
  String _discountType = 'مبلغ';
  String _quantityUnit = 'عدد';
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
          setState(() {
            selectedImages[index] = fileBytes;
          });
        } else {
          showToast(
            context: context,
            message: 'حجم تصویر باید کمتر از 500 کیلوبایت باشد',
            type: ToastType.error,
          );
        }
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  bool _isSpecial = false;

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
    _image.dispose();
    _description.dispose();
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
                        startChildren: [
                          BlocConsumer<ProductCreateCubit, ProductCreateState>(
                            listener: (context, state) {
                              if (state is ProductCreateSuccess) {
                                showToast(
                                    context: context,
                                    message: 'محصول مورد نظر با موفقیت اضافه شد',
                                    type: ToastType.success);
                                Navigator.pop(context);
                              } else if (state is ProductCreateError) {
                                print(state.message);
                                showToast(
                                    context: context,
                                    message: state.message,
                                    type: ToastType.error);
                              }
                            },
                            builder: (context, state) {
                              if (state is ProductCreateLoading) {
                                return const ProgressWidget();
                              } else {
                                return ButtonWidget(
                                  onPressed: () {
                                    _submit();
                                  },
                                  text: 'افزودن محصول',
                                );
                              }
                            },
                          ),
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
                                            errorText: _errors['name'],
                                          ),
                                        ),
                                        const SizedBox(width: spacingSmall),
                                        Expanded(
                                          child: TextFieldWidget(
                                            controller: _slug,
                                            label: 'کلمه کلیدی',
                                            errorText: _errors['slug'],
                                          ),
                                        ),
                                        const SizedBox(width: spacingSmall),
                                        Expanded(
                                            child: TextFieldWidget(
                                          controller: _barcode,
                                          label: 'بارکد',
                                          errorText: _errors['barcode'],
                                        )),
                                        BlocConsumer<BarcodeCubit,
                                                BarcodeState>(
                                            builder: (context, state) {
                                          if (state is BarcodeLoading) {
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: primaryColor,
                                                strokeWidth: 1,
                                              ),
                                            );
                                          } else {
                                            return Tooltip(
                                              message: 'تولید بارکد',
                                              child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<BarcodeCubit>()
                                                      .generator();
                                                },
                                                icon:  Icon(
                                                    IconsaxPlusLinear.barcode, color: Theme.of(context).hintColor,),
                                              ),
                                            );
                                          }
                                        }, listener: (context, state) {
                                          if (state is BarcodeLoaded) {
                                            _barcode.text = state.barcode;
                                          } else if (state is BarcodeError) {
                                            showToast(
                                                context: context,
                                                message: state.message,
                                                type: ToastType.error);
                                          }
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: spacingSmall),
                                    //02
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ValueListenableBuilder<String>(
                                            valueListenable: categoryTxt,
                                            builder: (context, value, child) {
                                              return ButtonPopupWidget(
                                                  widgetDialog: CategoryDialog(
                                                    onSelected:
                                                        (int id, String name) {
                                                      categoryTxt.value = name;
                                                      brandId = id;
                                                    },
                                                  ),
                                                  value: value,
                                                icon: IconsaxPlusLinear.category,
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: spacingSmall),
                                        Expanded(
                                          child: ValueListenableBuilder<String>(
                                            valueListenable: brandTxt,
                                            builder: (context, value, child) {
                                              return ButtonPopupWidget(
                                                  widgetDialog:  BrandsDialog(
                                                    onBrandSelected:
                                                        (int id,
                                                        String name) {
                                                      brandTxt.value = name;
                                                      brandId = id;
                                                    },
                                                  ),
                                                  value: value,
                                                icon: IconsaxPlusLinear.ticket_star,
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: spacingSmall),
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
                                          customTextStyles: const [
                                            TextStyle(fontSize: 12),
                                            TextStyle(fontSize: 12),
                                          ],
                                          onToggle: (index) {},
                                        ),
                                        const SizedBox(width: spacingSmall),
                                        CheckboxWidget(
                                          label: 'پیشنهادی',
                                          value: _isSpecial,
                                          onChanged: (value) {
                                            setState(() {
                                              _isSpecial = value!;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: spacingSmall),
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
                                                height: spacingSmall,
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
                            width: spacingSmall,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  /// TODO Images
                                  FormWidget(
                                    body: Column(
                                      children: [
                                        const TableHeaderWidget(
                                          title: "تصاویر",
                                        ),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: selectedImages.length,
                                          physics: const NeverScrollableScrollPhysics(),
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 1,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () => _pickImage(index),
                                              child: Container(
                                                margin: const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: smallRadius,
                                                  border: Border.all(
                                                    color: Theme.of(context).dividerColor,
                                                    style: BorderStyle.solid,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: selectedImages[index] != null
                                                    ? ClipRRect(
                                                  borderRadius: smallRadius,
                                                  child: Image.memory(
                                                    selectedImages[index]!,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                                )
                                                    : Center(
                                                  child: Icon(
                                                    index == 0
                                                        ? IconsaxPlusLinear.gallery_export
                                                        : IconsaxPlusLinear.gallery_add,
                                                    color: Theme.of(context).dividerColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),

                                        const SizedBox(
                                          height: spacingSmall,
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
                                  const SizedBox(
                                    height: spacingSmall,
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
                                                label: 'قیمت واحد (ریال)',
                                                inputType: TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                errorText: _errors['price'],
                                              ),
                                            ),
                                            const SizedBox(width: spacingSmall),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _sale_price,
                                                label: 'قیمت فروش (ریال)',
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                inputType: TextInputType.number,
                                                errorText:
                                                    _errors['sale_price'],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: spacingSmall),
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
                                            const SizedBox(width: spacingSmall),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _discount,
                                                label: 'مقدار تخفیف',
                                                inputType: TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: spacingSmall),
                                        Row(
                                          children: [
                                            //Type
                                            Expanded(
                                              child: SpinnerWidget(
                                                label: 'نوع بسته',
                                                items: const [
                                                  'عدد',
                                                  'بسته',
                                                  'کارتن',
                                                  'شیرینگ',
                                                  'کیسه',
                                                  'پالت',
                                                  'کلاف',
                                                  'قوطی',
                                                  'جعبه'
                                                ],
                                                onChanged: (p0) {
                                                  _quantityUnit = p0.toString();
                                                },
                                              ),
                                            ),
                                            SizedBox(width: spacingSmall),
                                            //Qantity
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: _quantity,
                                                label: 'موجودی',
                                                inputType: TextInputType.number,
                                                errorText: _errors['quantity'],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: spacingSmall),
                                        Divider(
                                          height: 1,
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        const SizedBox(height: spacingSmall),
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
                                            const SizedBox(width: spacingSmall),
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
                                        const SizedBox(height: spacingSmall),
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
                                            const SizedBox(width: spacingSmall),
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
                                        const SizedBox(height: spacingSmall),
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
                                            const SizedBox(width: spacingSmall),
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
              )),
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }

  /// Send request post
  Map<String, String?> _errors = {};
  void _submit() {
    try {
      FormValidator validator = FormValidator();
      final fields = {
        'name': _name.text,
        'barcode': _barcode.text,
        'slug': _slug.text,
        'quantity': _quantity.text,
        'price': _price.text,
        'sale_price': _sale_price.text,
      };
      final rules = {
        'name': 'required',
        'barcode': 'required',
        'slug': 'required',
        'quantity': 'required|numeric',
        'price': 'required|numeric',
        'sale_price': 'required|numeric',
      };
      final errors = validator.validateFields(fields, rules);
      if (validator.hasErrors()) {
        setState(() {
          _errors = errors;
        });
        return;
      }

      String? mainImage = (selectedImages.isNotEmpty && selectedImages[0] != null)
          ? base64Encode(selectedImages[0]!)
          : null;
      
      List<String> gallery = [];
      if (selectedImages.length > 1) {
        gallery = selectedImages
            .skip(1)
            .where((image) => image != null)
            .map((image) => base64Encode(image!))
            .toList();
      }

      context.read<ProductCreateCubit>().createProduct(Product(
        id: 1,
        name: _name.text,
        barcode: _barcode.text,
        slug: _slug.text,
        status: status.toString(),
        brand_id: brandId,
        brand: '',
        category_id: '1.5',
        category: [],
        description: _description.text,
        is_special: _isSpecial ? 1 : 0,
        quantity: int.parse(_quantity.text),
        quantity_unit: _quantityUnit,
        salePrice: int.parse(_sale_price.text),
        price: int.parse(_price.text),
        image: mainImage,
        gallery: gallery,
      ));
    } catch (e) {
      showToast(
        context: context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

}
