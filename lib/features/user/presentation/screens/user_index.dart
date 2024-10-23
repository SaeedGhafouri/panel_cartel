import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/features/user/logic/cubit/index/user_index_cubit.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/actions_popup_widget.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_widget.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';

class UserIndexScreen extends StatefulWidget {
  const UserIndexScreen({super.key});

  @override
  State<UserIndexScreen> createState() => _UserIndexScreenState();
}

class _UserIndexScreenState extends State<UserIndexScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserIndexCubit>().index();
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: containerHorizontal),
                  child: Column(
                    children: [
                      HeaderMain(title: 'مشتریان', crumbs: const [
                        'داشبورد',
                        'مدیریت مشتریان',
                      ]),
                      FormWidget(
                          body: Column(children: [
                        TableHeaderWidget(
                            isTable: true,
                            title: 'لیست مشتریان',
                            endChildren: [
                              CommadbarWidget(
                                text: 'مشتری جدید',
                                icon: IconsaxPlusLinear.add,
                                onPressed: () {
                                  // TODO: ا
                                  GoRouter.of(context).go('/users/userCreate');
                                },
                              ),
                              CommadbarWidget(
                                text: 'بروزرسانی',
                                icon: IconsaxPlusLinear.refresh,
                                onPressed: () {
                                  // context.read<ProductIndexCubit>().index();
                                },
                              )
                            ]),
                        const TableRowWidget(rowTitles: [
                          'تصویر',
                          'نام و نام خانوادگی',
                          'نقش',
                          'شماره موبایل',
                          'ایمیل',
                          'وضعیت',
                          'عملیات'
                        ]),
                        BlocConsumer<UserIndexCubit, UserIndexState>(
                          builder: (context, state) {
                            if (state is UserIndexLoading) {
                              return const ProgressWidget();
                            } else if (state is UserIndexLoaded) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.users.length,
                                  itemBuilder: (context, index) {
                                    final user = state.users[index];
                                    return TableColumnWidget(values: [
                                      user.status != null ? 'فعال' : 'غیرفعال',
                                      user.email,
                                      user.mobile,
                                      '${user.first_name} ${user.last_name}',
                                      user.image,
                                    ], actions: [
                                      ActionPopupWidget(
                                        onDelete: () {
                                          // TODO: اضافه کردن محصول
                                        },
                                      )
                                    ]);
                                  });
                            } else {
                              return const Text('خطایی رخ داده است');
                            }
                          },
                          listener:
                              (BuildContext context, UserIndexState state) {},
                        )
                      ]))
                    ],
                  ),
                ),
              )
            ],
          )),
      endDrawer: SideDrawer(),
    );
  }
}
