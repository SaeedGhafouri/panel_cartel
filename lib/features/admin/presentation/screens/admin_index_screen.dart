import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/features/admin/data/repositories/admin_repository.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/search_widget.dart';
import '../bloc/admin_bloc.dart';

class AdminIndexScreen extends StatefulWidget {
  const AdminIndexScreen({Key? key}) : super(key: key);
  @override
  _AdminIndexScreenState createState() => _AdminIndexScreenState();
}

class _AdminIndexScreenState extends State<AdminIndexScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminBloc(AdminRepository())..add(const GetAdmins()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: container,
            margin: container,
            child: Column(
              children: [
                HeaderMain(
                  title: 'کارشناسان',
                  crumbs: const [
                    'داشبورد',
                    'کارشناسان'
                  ],
                ),
                FormMain (
                  body: Column(
                    children: [
                      TableHeaderWidget(
                        endChildren: [
                          CommadbarWidget(
                            text: 'افزودن کارشناس',
                            icon: IconsaxPlusLinear.add_square,
                            onPressed: () {

                            },
                          ),
                          CommadbarWidget(
                            text: 'بروزرسانی',
                            icon: IconsaxPlusLinear.refresh_square_2,
                            onPressed: () {

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
                      BlocBuilder<AdminBloc, AdminState>(
                        builder: (context, state) {
                          if (state is AdminLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is AdminLoaded) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.data.length,
                                itemBuilder: (context, index) {
                                  return TableColumnWidget(
                                    values: [
                                      state.data[index].status,
                                      //state.data[index].createdAt,
                                      state.data[index].email,
                                      state.data[index].mobile,
                                      state.data[index].nationalCode,
                                      state.data[index].firstName + ' ' + state.data[index].lastName,
                                      state.data[index].image,
                                      state.data[index].id,
                                    ],
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                        },
                                        iconSize: 20,
                                        icon: const Icon(
                                          IconsaxPlusLinear.trash,
                                          color: dangerColor,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                        },
                                        iconSize: 20,
                                        icon: const Icon(
                                          IconsaxPlusLinear.edit_2,
                                          color: grayIconColor,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                        },
                                        iconSize: 20,
                                        icon: const Icon(
                                          IconsaxPlusLinear.eye,
                                          color: grayIconColor,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            );
                          } else if (state is AdminError) {
                            print(state.message);
                            return Center(child: Text(
                              state.message,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ));
                          } else {
                            return Center(child: Text(
                              'خطای بارگذاری',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ));
                          }
                        },
                      )


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}