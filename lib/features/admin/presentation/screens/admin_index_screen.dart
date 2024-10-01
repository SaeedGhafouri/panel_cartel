import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/actions_popup_widget.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/features/admin/presentation/screens/admin_create_screen.dart';
import 'package:panel_cartel/features/auth/logic/storage/expert/expert_preferences.dart';
import 'package:panel_cartel/features/auth/presentation/screens/login_screen.dart';
import '../../../../core/network/routes.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../../core/widgets/search_widget.dart';
import '../../../../core/widgets/side_drawer.dart';
import '../../logic/cubit/admin_cubit.dart';
import '../../logic/cubit/admin_state.dart';

class AdminIndexScreen extends StatefulWidget {
  static String routeName = '/admins';
  const AdminIndexScreen({super.key});

  @override
  _AdminIndexScreenState createState() => _AdminIndexScreenState();
}

class _AdminIndexScreenState extends State<AdminIndexScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('saeed');

    context.read<AdminCubit>().fetchAdmins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarMain(),
          SingleChildScrollView(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: containerHorizontal),
              child: Column(
                children: [
                  HeaderMain(
                    title: 'کارشناسان',
                    crumbs: const [
                      'داشبورد',
                      'کارشناسان'
                    ],
                  ),
                  FormWidget(
                    body: Column(
                      children: [
                        TableHeaderWidget(
                          endChildren: [
                            CommadbarWidget(
                              text: 'افزودن کارشناس',
                              icon: IconsaxPlusLinear.add,
                              onPressed: () {
                                // TODO: اضافه کردن کارشناس
                                GoRouter.of(context).push(AdminCreateScreen.routeName);
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
                          },
                          builder: (context, state) {
                            if (state is AdminLoading) {
                              return  Center(child: ProgressWidget());
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
                                      ActionPopupWidget(
                                        onDelete: () {
                                          context.read<AdminCubit>().deleteAdmin(admin.id!);
                                        },
                                        onUpdate: () {
                                          GoRouter.of(context).go('/admins/adminDetails/${3}');
                                        },
                                        onShow: () {
                                          GoRouter.of(context).go('/admins/adminDetails/${3}');
                                        },
                                      )
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
          )
        ],
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
