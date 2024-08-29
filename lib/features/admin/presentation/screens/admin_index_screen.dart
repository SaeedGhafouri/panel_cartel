import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/features/admin1/data/repositories/admin_repository.dart';
import '../../../../core/network/routes.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/search_widget.dart';
import '../../logic/cubit/admin_cubit.dart';
import '../../logic/cubit/admin_state.dart';
class AdminIndexScreen extends StatefulWidget {
  const AdminIndexScreen({Key? key}) : super(key: key);

  @override
  _AdminIndexScreenState createState() => _AdminIndexScreenState();
}

class _AdminIndexScreenState extends State<AdminIndexScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().fetchAdmins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderMain(
                title: 'کارشناسان',
                crumbs: const [
                  'داشبورد',
                  'کارشناسان'
                ],
              ),
              FormMain(
                body: Column(
                  children: [
                    TableHeaderWidget(
                      endChildren: [
                        CommadbarWidget(
                          text: 'افزودن کارشناس',
                          icon: IconsaxPlusLinear.add,
                          onPressed: () {
                            // TODO: اضافه کردن کارشناس
                          },
                        ),
                        CommadbarWidget(
                          text: 'بروزرسانی',
                          icon: IconsaxPlusLinear.refresh,
                          onPressed: () {
                            context.read<AdminCubit>().fetchAdmins();
                          },
                        ),
                      ],
                      startChildren: [
                        SearchFieldWidget(
                          controller: controller,
                        )
                      ],
                    ),
                    const TableRowWidget(
                      rowTitles: [
                        'عملیات',
                        'وضعیت',
                        //'تاریخ عضویت',
                        'ایمیل',
                        'شماره موبایل',
                        'کدملی',
                        'نام',
                        'تصویر',
                        'شناسه',
                      ],
                    ),
                    BlocConsumer<AdminCubit, AdminState>(
                      listener: (context, state) {
                     /*   if (state is AdminCreated) {
                          *//*ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );*//*
                        } else if (state is AdminUpdated) {
                         *//* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );*//*
                        } else if (state is AdminDeleted) {
                         *//* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );*//*
                        } else if (state is AdminError) {
                          *//*ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: ${state.message}')),
                          );*//*
                        }*/
                      },
                      builder: (context, state) {
                        if (state is AdminLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is AdminLoaded) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.admins.length,
                            itemBuilder: (context, index) {
                              final admin = state.admins[index];
                              return TableColumnWidget(
                                values: [
                                  admin.status,
                                  //admin.createdAt,
                                  admin.email,
                                  admin.mobile,
                                  admin.national_code,
                                  '${admin.first_name} ${admin.last_name}',
                                  admin.image,
                                  admin.id.toString(),
                                ],
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      // TODO: حذف ادمین
                                      context.read<AdminCubit>().deleteAdmin(admin.id!);
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
                        } else if (state is AdminError) {
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
