import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/actions_popup_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/features/product/logic/cubit/destroy/product_destroy_cubit.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../logic/cubit/index/product_index_cubit.dart';

class ProductIndexScreen extends StatefulWidget {
  final String routeName = '/products';
  const ProductIndexScreen({super.key});

  @override
  State<ProductIndexScreen> createState() => _ProductIndexScreenState();
}

class _ProductIndexScreenState extends State<ProductIndexScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductIndexCubit>().index();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(children: [
            AppBarMain(),
            Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: containerHorizontal),
                    child: Column(children: [
                      HeaderMain(title: 'محصولات', crumbs: const [
                        'داشبورد',
                        'فروشگاه',
                        'محصولات',
                      ]),
                      FormWidget(
                          body: Column(children: [
                        TableHeaderWidget(
                            isTable: true,
                            title: 'لیست محصولات',
                            endChildren: [
                              CommadbarWidget(
                                text: 'افزودن محصول',
                                icon: IconsaxPlusLinear.add,
                                onPressed: () {
                                  // TODO: اضافه کردن محصول
                                  GoRouter.of(context)
                                      .go('/products/productCreate');
                                },
                              ),
                              CommadbarWidget(
                                text: 'بروزرسانی',
                                icon: IconsaxPlusLinear.refresh,
                                onPressed: () {
                                  // TODO: اضافه کردن محصول
                                  context.read<ProductIndexCubit>().index();
                                },
                              )
                            ]),
                        const TableRowWidget(rowTitles: [
                          'عملیات',
                          'وضعیت',
                          'قیمت',
                          'تعداد',
                          'دسته بندی',
                          'برند',
                          'نام',
                          'تصویر',
                        ]),
                        BlocConsumer<ProductIndexCubit, ProductIndexState>(
                          builder: (context, state) {
                            if (state is ProductIndexLoading) {
                              return const ProgressWidget();
                            } else if (state is ProductIndexLoaded) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  final product = state.products[index];
                                  return TableColumnWidget(
                                    values: [
                                      product.status,
                                      product.price,
                                      product.quantity,
                                      product.category,
                                      product.brand,
                                      product.name,
                                      product.image,
                                    ],
                                    actions: [
                                      ActionPopupWidget(
                                        onDelete: () {
                                          try {
                                            context.read<ProductDestroyCubit>().destroy(product.id!);
                                            context.read<ProductIndexCubit>().index();
                                          } catch (e) {
                                            showToast(context: context, message: e.toString());
                                          }

                                        },
                                        onUpdate: () {

                                        },
                                        onShow: () {
                                          GoRouter.of(context).go('/products/productDetails/${product.id}');
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (state is ProductIndexError) {
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
                              if (state is ProductIndexLoaded) {

                            } else if (state is ProductIndexError) {
                              showToast(context: context, message: state.message);
                            }
                          },
                        )
                      ]))
                    ])))
          ])),
      endDrawer: const SideDrawer(),
    );
  }
}
