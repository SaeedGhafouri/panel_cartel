
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';

import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../logic/cubit/brand_cubit.dart';
import '../../logic/cubit/brand_state.dart';

class BrandIndexScreen extends StatefulWidget {
  static const String routeName = '/brands';
  const BrandIndexScreen({super.key});

  @override
  State<BrandIndexScreen> createState() => _BrandIndexScreenState();
}

class _BrandIndexScreenState extends State<BrandIndexScreen> {

  @override
  void initState() {
    super.initState();
    context.read<BrandCubit>().fetchBrands();
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
                            title: 'برندها',
                            crumbs: const [
                              'داشبورد',
                              'فروشگاه',
                              'برندها',
                            ]
                        ),
                        FormWidget(
                            body: Column(
                                children: [
                                  const TableHeaderWidget(
                                      endChildren: [
                                      ]
                                  ),
                                  const TableRowWidget(
                                      rowTitles: [
                                        'وضعیت',
                                        'توضیحات',
                                        'نام',
                                        'تصویر'
                                        'شناسه',
                                      ]
                                  ),
                                  BlocConsumer<BrandCubit, BrandState>(
                                    builder: (context, state) {
                                      if (state is BrandLoading) {
                                        return  ProgressWidget();
                                      } else if (state is BrandLoaded) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: state.Brands.length,
                                          itemBuilder: (context, index) {
                                            final Brand = state.Brands[index];
                                            return TableColumnWidget(
                                              values: [
                                                Brand.status,
                                                //Brand.createdAt,
                                                Brand.name,
                                                Brand.id.toString(),
                                              ],
                                              actions: [
                                                IconButton(
                                                  onPressed: () {
                                                    // TODO: حذف برند
                                                    //context.read<BrandCubit>().deleteBrand(Brand.id!);
                                                  },
                                                  iconSize: 20,
                                                  icon: const Icon(
                                                    IconsaxPlusLinear.trash,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    // TODO: ویرایش برند
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
                                                    // TODO: مشاهده جزئیات برند
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
                                      } else if (state is BrandError) {
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
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
