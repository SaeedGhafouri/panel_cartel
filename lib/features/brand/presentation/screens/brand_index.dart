import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_cartel/core/widgets/actions_popup_widget.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/button_widget.dart';
import 'package:panel_cartel/core/widgets/commadbar_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/item_footer_widget.dart';
import 'package:panel_cartel/core/widgets/image_picker_widget.dart';
import 'package:panel_cartel/core/widgets/search_widget.dart';
import 'package:panel_cartel/core/widgets/side_drawer.dart';
import 'package:panel_cartel/core/widgets/status_switch_widget.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/datagrid/table_column_widget.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../../../core/widgets/datagrid/table_row_widget.dart';
import '../../../../core/widgets/form_widget.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../../core/widgets/progress_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../logic/cubit/index/brand_index_cubit.dart';
import '../../logic/cubit/index/brand_index_state.dart';

class BrandIndexScreen extends StatefulWidget {
  static const String routeName = '/brands';
  const BrandIndexScreen({super.key});

  @override
  State<BrandIndexScreen> createState() => _BrandIndexScreenState();
}

class _BrandIndexScreenState extends State<BrandIndexScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      final nameText = _nameController.text;
      final slugText = nameText.replaceAll(' ', '-');
      _slugController.text = slugText;
    });
    context.read<BrandIndexCubit>().index();
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
                      child: Column(children: [
                        HeaderMain(title: 'برندها', crumbs: const [
                          'داشبورد',
                          'فروشگاه',
                          'برندها',
                        ]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Create
                            Expanded(
                                flex: 4,
                                child: FormWidget(
                                  body: Column(children: [
                                    const TableHeaderWidget(
                                      title: 'ایجاد برند جدید',
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    ImagePickerWidget(
                                      onImageSelected: (p0) {},
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFieldWidget(
                                            label: 'نام برند',
                                            controller: _nameController,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: spacingSmall,
                                        ),
                                        Expanded(
                                          child: TextFieldWidget(
                                            label: 'نام مرحله ای',
                                            controller: _slugController,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: TextFieldWidget(
                                            label: 'توضیحات',
                                            controller:
                                            _descriptionController,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: spacingSmall,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: StatusSwitchWidget(
                                              onToggle: (p0) {},
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      width: spacingSmall,
                                    ),
                                    const SizedBox(height: spacingMedium,),
                                    ButtonWidget(
                                      text: 'افزودن برند',
                                      onPressed: () {},
                                    )
                                  ]),
                                )),
                            const SizedBox(
                              width: spacingSmall,
                            ),

                            /// Index
                            Expanded(
                              flex: 6,
                              child: FormWidget(
                                  body: Column(children: [
                                    TableHeaderWidget(
                                        startChildren: [
                                          SearchFieldWidget(controller: _searchController, onPressed: () {
                                            context.read<BrandIndexCubit>().index(filter: _searchController.text);
                                          },)
                                        ],
                                        isTable: true,
                                        endChildren: [
                                          CommadbarWidget(
                                            text: 'بروزرسانی',
                                            onPressed: () {
                                              context
                                                  .read<BrandIndexCubit>()
                                                  .index();
                                            },
                                          )
                                        ]),
                                    const TableRowWidget(rowTitles: [
                                      'تصویر',
                                      'نام',
                                      'وضعیت',
                                      'تاریخ ثبت',
                                      'توضیحات',
                                      '#',
                                    ]),
                                    BlocConsumer<BrandIndexCubit, BrandIndexState>(
                                      builder: (context, state) {
                                        if (state is BrandIndexLoading) {
                                          return const ProgressWidget();
                                        } else if (state is BrandIndexLoaded) {
                                          return Column(
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: state.brands.length,
                                                itemBuilder: (context, index) {
                                                  final brand = state.brands[index];
                                                  return TableColumnWidget(
                                                    values: [
                                                      brand.description,
                                                      brand.createdAt,
                                                      brand.status,
                                                      brand.name,
                                                      brand.image,
                                                    ],
                                                    actions: [const ActionPopupWidget()],
                                                  );
                                                },
                                              ),
                                              const SizedBox(
                                                height: spacingSmall,
                                              ),
                                              ItemFooterWidget(
                                                numberPages: state.lastPage,
                                                initialPage: state.currentPage - 1,
                                                total: state.total,
                                                onPageChanged: (int index) {
                                                  context.read<BrandIndexCubit>().index(page: index + 1);
                                                },
                                              )
                                            ],
                                          );
                                        } else if (state is BrandIndexError) {
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
                                      listener: (context, state) {},
                                    )

                                  ])),
                            ),
                          ],
                        )
                      ])
                  ))
            ],
          )),
      endDrawer: const SideDrawer(),
    );
  }
}
