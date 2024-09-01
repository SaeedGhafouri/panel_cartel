
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';

import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../logic/cubit/product_cubit.dart';

class ProductIndexScreen extends StatefulWidget {
  final String routeName = '/products';
  const ProductIndexScreen({super.key});

  @override
  State<ProductIndexScreen> createState() => _ProductIndexScreenState();
}

class _ProductIndexScreenState extends State<ProductIndexScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarMain(),
          SingleChildScrollView(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: containerHorizontal),
              child: Column(
                children: [
                  HeaderMain(
                    title: 'محصولات',
                    crumbs: const [
                      'داشبورد',
                      'فروشگاه',
                      'محصولات',
                    ]
                  ),
                  FormWidget(
                    body: Column(
                      children: [
                        TableHeaderWidget(
                          endChildren: [
                            CommadbarWidget(
                              text: 'افزودن محصول',
                              icon: IconsaxPlusLinear.add,
                              onPressed: () {
                                // TODO: اضافه کردن محصول
                              },
                            ),
                            CommadbarWidget(
                              text: 'بروزرسانی',
                             icon: IconsaxPlusLinear.refresh,
                              onPressed: () {
                                // TODO: اضافه کردن محصول
                              },
                            )
                          ]
                        ),
                        const TableRowWidget(
                          rowTitles: [
                            'عملیات',
                            'تصویر',
                            'نام',
                            'توضیحات',
                            'قیمت',
                            'تعداد',
                            'دسته بندی',
                            'برند',
                            'شناسه',
                          ]
                        ),
                        BlocConsumer<ProductCubit, ProductState>(
                            builder: (context, state) {
                              if (state is ProductLoading) {
                                return  ProgressWidget();
                              } else if (state is ProductLoaded) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.Products.length,
                                  itemBuilder: (context, index) {
                                    final Product = state.Products[index];
                                    return TableColumnWidget(
                                      values: [
                                        Product.status,
                                        //Product.createdAt,
                                        Product.name,
                                        Product.quantity,
                                        Product.price,
                                        Product.brand,
                                        Product.id.toString(),
                                      ],
                                      actions: [
                                        IconButton(
                                          onPressed: () {
                                            // TODO: حذف ادمین
                                            //context.read<ProductCubit>().deleteProduct(Product.id!);
                                          },
                                          iconSize: 20,
                                          icon: const Icon(
                                            IconsaxPlusLinear.trash,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // TODO: ویرایش ادمین
                                            GoRouter.of(context).go('/login');
                                          },
                                          iconSize: 20,
                                          icon: const Icon(
                                            IconsaxPlusLinear.edit_2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // TODO: مشاهده جزئیات ادمین
                                            Navigator.pushNamed(context, LoginScreen.routeName);
                                          },
                                          iconSize: 20,
                                          icon: const Icon(
                                            IconsaxPlusLinear.eye,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (state is ProductError) {
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
                              
                            },
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        ]
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
