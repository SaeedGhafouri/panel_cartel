import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/utils/date_converter.dart';
import 'package:panel_cartel/core/utils/toast.dart';
import 'package:panel_cartel/core/widgets/actions_popup_widget.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_row_widget.dart';
import 'package:panel_cartel/core/widgets/progress_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/text_field_widget.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/commadbar_main.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../data/models/permission_model.dart';
import '../../logic/cubit/permission/permission_cubit.dart';
import '../../logic/cubit/role/role_cubit.dart';

class AdminRoleScreen extends StatefulWidget {
  final String routeName = '/adminRole';
  final double? adminId;
  const AdminRoleScreen({super.key, this.adminId});

  @override
  State<AdminRoleScreen> createState() => _AdminRoleScreenState();
}

class _AdminRoleScreenState extends State<AdminRoleScreen> {
  final TextEditingController _roleNameController = TextEditingController();
  final TextEditingController _roleKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RoleCubit>().index();
    context.read<PermissionCubit>().index();
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
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: containerHorizontal,
                ),
                children: [
                  HeaderMain(
                    title: 'نقش ها و دسترسی ها',
                    crumbs: const [
                      'داشبورد',
                      'کارشناسان',
                      'نقش ها و دسترسی ها'
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Right
                      Expanded(
                        flex: 6,
                        child: FormWidget(
                          body: Column(
                            children: [
                              TableHeaderWidget(
                                title: 'ایجاد عناوین سطحی',
                                endChildren: [
                                  CommadbarWidget(
                                    text: 'تایید و ذخیره',
                                    background: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                    icon: Icons.check,
                                    iconColor: Colors.white,
                                    onPressed: () {
                                      // your onPressed logic here
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: padding_30,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: primaryHarmonyColor,
                                        borderRadius: smallRadius,
                                      ),
                                      child: Icon(
                                        IconsaxPlusBold.user_tick,
                                        size: 45,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: spacingThin),
                                    // Title
                                    Text('عنوان شغلی',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const SizedBox(height: 5),
                                    Text('لورم اپسولدی ای اینجا قرار میگیرد',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                    const SizedBox(height: spacingSmall),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFieldWidget(
                                            label: 'نام',
                                            controller: _roleNameController,
                                          ),
                                        ),
                                        const SizedBox(width: spacingThin),
                                        Expanded(
                                          child: TextFieldWidget(
                                            label: 'کلید',
                                            controller: _roleKeyController,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: spacingSmall),
                                    Text('دسترسی ها',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    const SizedBox(height: 5),
                                    Text(
                                      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    const SizedBox(height: spacingSmall),
                                    BlocConsumer<PermissionCubit,
                                        PermissionState>(
                                      builder: (context, state) {
                                        if (state is PermissionLoading) {
                                          return const Center(
                                              child: ProgressWidget());
                                        } else if (state is PermissionLoaded) {
                                          final permissionsMap =
                                              state.permissions;
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: permissionsMap.length,
                                            itemBuilder: (context, index) {
                                              final category = permissionsMap
                                                  .keys
                                                  .elementAt(index);
                                              final permissions =
                                                  permissionsMap[category]!;

                                              return ExpansionTile(
                                                shape: OutlineInputBorder(
                                                    borderRadius: smallRadius,
                                                    borderSide: BorderSide(
                                                        color: Theme.of(context)
                                                            .dividerColor)),
                                                collapsedTextColor:
                                                    Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.color,
                                                title: Text(
                                                  category,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge,
                                                ),
                                                children: permissions
                                                    .map<Widget>((permission) {
                                                  return ListTile(
                                                    title: Text(
                                                      permission.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    subtitle: Text(
                                                      permission.desc,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge,
                                                    ),
                                                    trailing: Checkbox(
                                                        activeColor:
                                                            primaryColor,
                                                        value: false,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(3)),
                                                          side: BorderSide(
                                                            color: Theme.of(context).dividerColor
                                                          )
                                                        ),
                                                        onChanged: (value) {}),
                                                  );
                                                }).toList(),
                                              );
                                            },
                                          );
                                        } else if (state is PermissionError) {
                                          return Center(
                                              child: Text(state.message));
                                        } else {
                                          return Center(
                                              child: Text('Unknown State'));
                                        }
                                      },
                                      listener: (context, state) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: spacingSmall),

                      /// Left
                      Expanded(
                        flex: 4,
                        child: FormWidget(
                          body: Column(
                            children: [
                              TableHeaderWidget(
                                title: 'لیست دسترسی ها',
                                endChildren: [
                                  CommadbarWidget(
                                    text: 'بروزرسانی',
                                    icon: Icons.sync,
                                    onPressed: () {
                                      context.read<RoleCubit>().index();
                                    },
                                  ),
                                ],
                              ),
                              const TableRowWidget(
                                rowTitles: [
                                  'شناسه',
                                  'عنوان',
                                  'کلید',
                                  'تاریخ ثبت',
                                  '#',
                                ],
                              ),
                              BlocConsumer<RoleCubit, RoleState>(
                                builder: (context, state) {
                                  if (state is RoleLoading) {
                                    return const Center(
                                        child: ProgressWidget());
                                  }
                                  if (state is RoleError) {
                                    return Center(child: Text(state.message));
                                  } else if (state is RoleLoaded) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.roles.length,
                                      itemBuilder: (context, index) {
                                        return TableColumnWidget(
                                          values: [
                                            DateConverter().convertToShamsi(
                                                state.roles[index].createdAt),
                                            state.roles[index].key,
                                            state.roles[index].name,
                                            state.roles[index].id.toString(),
                                          ],
                                          actions: [
                                            ActionPopupWidget(
                                              onDelete: () {
                                                // Add delete functionality here
                                              },
                                              onShow: () {

                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    return const Text('نامشخص');
                                  }
                                },
                                listener: (context, state) {
                                  if (state is RoleError) {
                                    showToast(
                                        context: context,
                                        message: state.message);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: const SideDrawer(),
    );
  }
}
