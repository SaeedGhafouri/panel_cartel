import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/features/user/logic/cubit/index/user_index_cubit.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/actions_popup_widget.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/commadbar_widget.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/error_response_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../../core/widgets/search_widget.dart';

class UserIndexScreen extends StatefulWidget {
  final String routeName = '/users';
  const UserIndexScreen({super.key});

  @override
  State<UserIndexScreen> createState() => _UserIndexScreenState();
}

class _UserIndexScreenState extends State<UserIndexScreen> {
  final TextEditingController controller = TextEditingController();
  
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
              const AppBarMain(),
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
                            startChildren: [
                              CommadbarWidget(
                                text: 'بروزرسانی',
                                icon: IconsaxPlusLinear.refresh,
                                onPressed: () {
                                  context.read<UserIndexCubit>().index();
                                },
                              ),
                              CommadbarWidget(
                                text: 'افزودن مشتری',
                                icon: IconsaxPlusLinear.add,
                                onPressed: () {
                                  // TODO: ا
                                  GoRouter.of(context).go('/users/userCreate');
                                },
                              ),
                            ],
                          endChildren: [
                            SearchFieldWidget(
                              controller: controller,
                              onTap: () => context
                                  .read<UserIndexCubit>()
                                  .index(filter: controller.text),
                            )
                          ],
                        ),
                            const TableRowWidget(
                              rowTitles: [
                                'تصویر',
                                'نام',
                                'کدملی',
                                'شماره موبایل',
                                'ایمیل',
                                'وضعیت',
                                'تاریخ ثبت نام',
                                'عملیات',
                              ],
                            ),
                            BlocConsumer<UserIndexCubit, UserIndexState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is UserIndexLoading) {
                                  return Center(child: ProgressWidget());
                                } else if (state is UserIndexLoaded) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.users.length,
                                    itemBuilder: (context, index) {
                                      final user = state.users[index];
                                      return TableColumnWidget(
                                        values: [
                                          user.created_at,
                                          user.status,
                                          user.email,
                                          user.mobile,
                                          user.national_code,
                                          '${user.first_name} ${user.last_name}',
                                          user.image,
                                        ],
                                        actions: [
                                          ActionPopupWidget(
                                            onUpdate: () {
                                              context.go(
                                                  '${AppRoutes.users}/${AppRoutes.userDetails}/${user.id}');
                                            },
                                            onShow: () {
                                              context.go(
                                                '${AppRoutes.users}/details/${user.id}'
                                              );
                                            },
                                            /*onDelete: () {
                                              try {
                                                context
                                                    .read<UserDestroyCubit>()
                                                    .destroy(User.id!);
                                                context
                                                    .read<UserIndexCubit>()
                                                    .index();
                                                showToast(
                                                    context: context,
                                                    message:
                                                    'کارشناس با موفقیت حذف شد',
                                                    type: ToastType.success);
                                              } catch (e) {
                                                showToast(
                                                    context: context,
                                                    message: e.toString());
                                              }
                                            },
                                            onUpdate: () {
                                              context.go(
                                                  '${AppRoutes.Users}/details/2');
                                            },
                                            onShow: () {
                                              GoRouter.of(context).go(
                                                  '/Users/UserDetails/${3}');
                                            },*/
                                          )
                                        ],
                                      );
                                    },
                                  );
                                } else if (state is UserIndexError) {
                                  return ErrorResponseWidget(
                                      message: state.message);
                                } else {
                                  return Center(
                                    child: Text(
                                      'خطای بارگذاری',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                  );
                                }
                              },
                            ),
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
