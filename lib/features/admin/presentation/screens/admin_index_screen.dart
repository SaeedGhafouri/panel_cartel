import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/actions_popup_widget.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/features/admin/logic/cubit/index/admin_index_cubit.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/commadbar_widget.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/error_response_widget.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../../core/widgets/search_widget.dart';
import '../../../../core/widgets/side_drawer.dart';
import '../../logic/cubit/destroy/admin_destroy_cubit.dart';

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

    context.read<AdminIndexCubit>().index();
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
                        HeaderMain(
                          title: 'کارشناسان',
                          crumbs: const ['داشبورد', 'کارشناسان'],
                        ),
                        FormWidget(
                          body: Column(
                            children: [
                              TableHeaderWidget(
                                startChildren: [
                                  CommadbarWidget(
                                    text: 'بروزرسانی',
                                    icon: IconsaxPlusLinear.refresh,
                                    onPressed: () {
                                      context.read<AdminIndexCubit>().index();
                                    },
                                  ),
                                  CommadbarWidget(
                                    text: 'نقش ها و دسترسی ها',
                                    icon: IconsaxPlusLinear.lock_1,
                                    onPressed: () {
                                      context.go(
                                          '${AppRoutes.admins}/${AppRoutes.adminRoles}');
                                    },
                                  ),
                                  CommadbarWidget(
                                    text: 'افزودن کارشناس',
                                    icon: IconsaxPlusLinear.add,
                                    onPressed: () {
                                      context.go(
                                          '${AppRoutes.admins}/${AppRoutes.adminCreate}');
                                    },
                                  ),
                                ],
                                endChildren: [
                                  SearchFieldWidget(
                                    controller: controller,
                                    onTap: () => context
                                        .read<AdminIndexCubit>()
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
                              BlocConsumer<AdminIndexCubit, AdminIndexState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state is AdminIndexLoading) {
                                    return Center(child: ProgressWidget());
                                  } else if (state is AdminIndexLoaded) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.admins.length,
                                      itemBuilder: (context, index) {
                                        final admin = state.admins[index];
                                        return TableColumnWidget(
                                          values: [
                                            admin.created_at,
                                            admin.status,
                                            admin.email,
                                            admin.mobile,
                                            admin.national_code,
                                            '${admin.first_name} ${admin.last_name}',
                                            admin.image,
                                          ],
                                          actions: [
                                            ActionPopupWidget(
                                              onDelete: () {
                                                try {
                                                  context
                                                      .read<AdminDestroyCubit>()
                                                      .destroy(admin.id!);
                                                  context
                                                      .read<AdminIndexCubit>()
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
                                                    '${AppRoutes.admins}/details/${admin.id}');
                                              },
                                              onShow: () {
                                                context.go(
                                                    '${AppRoutes.admins}/details/${admin.id}');
                                              },
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  } else if (state is AdminIndexError) {
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
                            ],
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
