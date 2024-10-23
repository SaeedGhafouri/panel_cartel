import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/dialogs/price_and_quantity_dialog.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/commadbar_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/image_diplay_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/features/product/data/models/product_model.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../logic/cubit/show/product_show_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? productId;
  const ProductDetailsScreen({super.key, this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> imgList = [
    'https://up.7learn.com/z/s/wp/2019/09/003.jpg',
    'https://up.7learn.com/z/s/wp/2019/09/003.jpg',
    'https://up.7learn.com/z/s/wp/2019/09/003.jpg',
    'https://up.7learn.com/z/s/wp/2019/09/003.jpg',
    'https://up.7learn.com/z/s/wp/2019/09/003.jpg',
  ];
  late int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductShowCubit>().show(widget.productId!);
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    HeaderMain(
                      title: 'جزئیات محصول',
                      crumbs: const ['داشبورد', 'فروشگاه', 'محصولات'],
                    ),
                    BlocConsumer<ProductShowCubit, ProductShowState>(
                      builder: (context, state) {
                        if (state is ProductShowLoading) {
                          return const Center(child: ProgressWidget(),);
                        } else if (state is ProductShowLoaded) {
                          return form(state.product);
                        } else if (state is ProductShowError) {
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
                      listener: (context, state) {
                        if (state is ProductShowLoaded) {

                        } else if (state is ProductShowError) {
                          showToast(context: context, message: state.message);
                        }
                      },
                    )
                  ],
                ),
              )))
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }

  Widget form(Product product) {
    return FormWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableHeaderWidget(
            title: 'مشخصات محصول',
            endChildren: [
              CommadbarWidget(
                text: 'لیست محصولات',
                icon: IconsaxPlusLinear.eye,
                onPressed: () {},
              ),
              CommadbarWidget(
                text: 'ویرایش',
                icon: IconsaxPlusLinear.edit_2,
                onPressed: () {},
              ),
              CommadbarWidget(
                text: 'حذف',
                textColor: dangerColor,
                iconColor: dangerColor,
                icon: IconsaxPlusLinear.trash,
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              //Right
              Expanded(
                  flex: 8,
                  child: Container(
                    padding: container,
                    child: Column(
                      children: [
                        //Top
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            //Slider
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 400,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        smallRadius,
                                      ),
                                      child: CarouselSlider(
                                        carouselController:
                                        _controller,
                                        options:
                                        CarouselOptions(
                                            autoPlay: true,
                                            enlargeCenterPage:
                                            true,
                                            aspectRatio:
                                            2.0,
                                            onPageChanged:
                                                (Show,
                                                reason) {
                                              setState(() {
                                                _current =
                                                    Show;
                                              });
                                            }),
                                        items: imgList
                                            .map((item) =>
                                            Container(
                                              margin:
                                              padding_20,
                                              child:
                                              ClipRRect(
                                                borderRadius:
                                                smallRadius,
                                                child:
                                                AspectRatio(
                                                  aspectRatio:
                                                  1,
                                                  child:
                                                  ImageDisplayWidget(
                                                    imageUrl:
                                                    item,
                                                    radius:
                                                    radiusSmall,
                                                  ),
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      children: imgList
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        return GestureDetector(
                                          onTap: () =>
                                              _controller
                                                  .animateToPage(
                                                  entry
                                                      .key),
                                          child: Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin:
                                            const EdgeInsets
                                                .symmetric(
                                                vertical:
                                                8.0,
                                                horizontal:
                                                4.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape
                                                    .circle,
                                                color: (Theme.of(context).brightness ==
                                                    Brightness
                                                        .dark
                                                    ? Colors
                                                    .white
                                                    : Colors
                                                    .black)
                                                    .withOpacity(_current ==
                                                    entry.key
                                                    ? 0.9
                                                    : 0.4)),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              width: spacingSmall,
                            ),
                            //Info
                            Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    //Id
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'شناسه:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.id.toString(),
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    //Barcode
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'بارکد:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.barcode!,
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              '#',
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .headlineLarge,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    //Name
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'نام محصول:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.name!,
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    //Slug
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'Slug:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.slug!,
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .headlineMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    //Brand
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'برند:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.brand!,
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    // Category
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          'دسته بندی:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        Row(
                                          children: [
                                            // show List<dynamic> on text
                                            Text(
                                              product.category!
                                                  .join('/ '),
                                              style: Theme.of(
                                                  context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    // Desc
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'توضیحات:',
                                          style: Theme.of(
                                              context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          product.description!,
                                          style:
                                          Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        )
                        //Bottom
                      ],
                    ),
                  )),
              const SizedBox(
                width: spacingSmall,
              ),
              //Fin
              Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: smallRadius,
                          border:
                          Border.fromBorderSide(BorderSide(
                            color:
                            Theme.of(context).dividerColor,
                            width: 1.5,
                          ))),
                      child: Padding(
                        padding: container,
                        child: Column(
                          children: [
                            //Rank
                            Container(
                              height: 90,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: smallRadius,
                                border:
                                const Border.fromBorderSide(
                                    BorderSide(
                                      color: dangerColor,
                                      width: 1.5,
                                    )),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '3',
                                          style: TextStyle(
                                              fontFamily:
                                              font_medium,
                                              fontSize: txt_60,
                                              color:
                                              dangerColor),
                                        ),
                                        TextSpan(
                                          text: '/10',
                                          style: TextStyle(
                                              fontFamily:
                                              font_medium,
                                              fontSize: txt_50,
                                              color:
                                              dangerColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'ضعیف',
                                    style: TextStyle(
                                        color: dangerColor,
                                        fontFamily: font_medium,
                                        fontSize: txt_40),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: spacingLarg,
                            ),
                            //Quantity
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  'موجودی کالا:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      product.quantity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'کارتن',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: spacingThin,
                            ),
                            //Order number
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  'تعداد سفارشات:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      /// Todo: show order count
                                      '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'کارتن',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            //Price
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  'قیمت اصلی:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      product.price.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'ریال',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: spacingThin,
                            ),
                            //Discount
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  'تخفیف:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                Row(
                                  children: [
                                    /// Todo: show discount
                                    Text(
                                      '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'ریال',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: spacingThin,
                            ),
                            //Payable
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  'قیمت نهایی:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      product.salePrice.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'ریال',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: spacingSmall,
                            ),
                            ButtonWidget(
                              text: 'مدیریت قیمت و موجودی',
                              onPressed: () {
                                showDialog(context: context, builder: (context){
                                  return const PriceAndQuantityDialog();
                                });
                              },
                            )
                          ],
                        ),
                      )))
            ],
          )
          //01
        ],
      ),
    );
  }
}
