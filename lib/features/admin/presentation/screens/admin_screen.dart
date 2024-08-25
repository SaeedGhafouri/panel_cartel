import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/form_main.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/features/admin/data/repositories/admin_repository.dart';
import 'package:panel_cartel/features/dashboard/presentation/screens/dashboard_screen.dart';

import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/item_image.dart';
import '../../../../core/widgets/datagrid/item_text.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/search_widget.dart';
import '../bloc/admin_bloc.dart';
import 'admin_create_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
                        end_children: [
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
                              BlocProvider.of<AdminBloc>(context).add(GetAdmins());
                            },
                          ),
                        ],
                        start_children: [
                          SearchFieldWidget(
                            controller: controller,
                          )
                        ],
                      ),
                      const TableRowWidget(
                        row_titles: [
                          'عملیات',
                          'وضعیت',
                          'تاریخ ثبت نام',
                          'ایمیل',
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
                                      state.data[index].id,
                                      state.data[index].firstName,
                                      state.data[index].mobile,
                                      state.data[index].email,
                                      state.data[index].firstName,
                                      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                                      //state.data[index].image,
                                      state.data[index].id,
                                    ],
                                  );
                                  /*return Container(
                                      child: Row(
                                          children: [
                                            //ItemImage(imageUrl: state.data[index].image),
                                            ItemText(value: state.data[index].firstName),
                                            ItemText(value: state.data[index].email),
                                          ]
                                      )
                                  );*/
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