import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/header_main.dart';
import 'package:panel_cartel/core/widgets/search_widget.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/datagrid/table_header_widget.dart';
import '../../data/models/sales_data_model.dart';

class OrderIndexScreen extends StatefulWidget {
  const OrderIndexScreen({super.key});

  @override
  State<OrderIndexScreen> createState() => _OrderIndexScreenState();
}

class _OrderIndexScreenState extends State<OrderIndexScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<SalesData> salesData = [
      SalesData('شنبه', 15000),
      SalesData('یک‌شنبه', 12000),
      SalesData('دوشنبه', 14000),
      SalesData('سه‌شنبه', 11000),
      SalesData('چهارشنبه', 16000),
      SalesData('پنج‌شنبه', 13000),
      SalesData('جمعه', 10000),
    ];

    return Scaffold(
      body: Column(
        children: [
          const AppBarMain(),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: containerHorizontal),
                child: Column(
                  children: [
                    HeaderMain(
                      title: 'مدیریت سفارشات',
                      crumbs: const ['داشبورد', 'سفارشات', 'مدیریت سفارشات'],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 6,
                            child: FormWidget(
                                body: Column(
                              children: [
                                const TableHeaderWidget(
                                  title: 'آمار فروش',
                                ),
                                SizedBox(
                                  height: 300,
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceEvenly,
                                      maxY: 20000,
                                      barTouchData: BarTouchData(enabled: true),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            getTitlesWidget: (value, meta) {
                                              const style = TextStyle(
                                                fontSize: 12,
                                                color: grayTextColor,
                                              );
                                              switch (value.toInt()) {
                                                case 0:
                                                  return const Text('شنبه',
                                                      style: style);
                                                case 1:
                                                  return const Text('یک‌شنبه',
                                                      style: style);
                                                case 2:
                                                  return const Text('دوشنبه',
                                                      style: style);
                                                case 3:
                                                  return const Text('سه‌شنبه',
                                                      style: style);
                                                case 4:
                                                  return const Text('چهارشنبه',
                                                      style: style);
                                                case 5:
                                                  return const Text('پنج‌شنبه',
                                                      style: style);
                                                case 6:
                                                  return const Text('جمعه',
                                                      style: style);
                                                default:
                                                  return const Text('');
                                              }
                                            },
                                          ),
                                        ),
                                        leftTitles: const AxisTitles(
                                          sideTitles:
                                              SideTitles(showTitles: true),
                                        ),
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      barGroups: [
                                        BarChartGroupData(x: 0, barRods: [
                                          BarChartRodData(
                                              toY: 15000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 1, barRods: [
                                          BarChartRodData(
                                              toY: 12000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 2, barRods: [
                                          BarChartRodData(
                                              toY: 14000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 3, barRods: [
                                          BarChartRodData(
                                              toY: 11000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 4, barRods: [
                                          BarChartRodData(
                                              toY: 16000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 5, barRods: [
                                          BarChartRodData(
                                              toY: 13000, color: primaryColor),
                                        ]),
                                        BarChartGroupData(x: 6, barRods: [
                                          BarChartRodData(
                                              toY: 10000, color: primaryColor),
                                        ]),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))),
                        const SizedBox(
                          width: spacingSmall,
                        ),
                        Expanded(
                            flex: 4,
                            child: FormWidget(
                                body: FormWidget(
                                    body: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const TableHeaderWidget(
                                  title: 'وضعیت',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1,
                                            child: PieChart(
                                                PieChartData(sections: [
                                              PieChartSectionData(
                                                  color: Colors.redAccent,
                                                  value: 20,
                                                  title: '20%',
                                                  radius: 50,
                                                  titleStyle: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              PieChartSectionData(
                                                  color: Colors.greenAccent,
                                                  value: 23,
                                                  title: '23%',
                                                  radius: 50,
                                                  titleStyle: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              PieChartSectionData(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  value: 64,
                                                  title: '64%',
                                                  radius: 50,
                                                  titleStyle: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ])),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // cycle with text
                                              Row(children: [
                                                const CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                ),
                                                const SizedBox(
                                                  width: spacingSmall,
                                                ),
                                                Text('تایید شده',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!)
                                              ])
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: spacingSmall,
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          children: [
                                            /// Discount
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'تخفیف',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          color: Colors
                                                              .blueAccent),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '140,000,000',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    const SizedBox(
                                                      width: spacingThin,
                                                    ),
                                                    Text(
                                                      'ریال',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: spacingSmall,
                                            ),

                                            /// Cancel
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'لغو شده',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          color:
                                                              Colors.redAccent),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '140,000,000',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    const SizedBox(
                                                      width: spacingThin,
                                                    ),
                                                    Text(
                                                      'ریال',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: spacingSmall,
                                            ),

                                            /// Submit
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'تکمیل شده',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          color: Colors
                                                              .greenAccent),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '140,000,000',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    const SizedBox(
                                                      width: spacingThin,
                                                    ),
                                                    Text(
                                                      'ریال',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: spacingSmall,
                                            ),

                                            /// Total
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'جمع کل',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '140,000,000',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    const SizedBox(
                                                      width: spacingThin,
                                                    ),
                                                    Text(
                                                      'ریال',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: spacingSmall,
                                            ),
                                          ],
                                        ))
                                  ],
                                )
                              ],
                            )))),
                      ],
                    ),
                    const SizedBox(
                      height: spacingSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('سفارشات اخیر',
                                style: TextStyle(
                                  fontFamily: font_bold,
                                  fontSize: txt_50,
                                )),
                            const SizedBox(
                              height: spacingThin,
                            ),
                            Text(
                                'آخرین سفارشات و جزئیات مربوط به سفارشات اخیر را مشاهده کنید.',
                                style:
                                    Theme.of(context).textTheme.headlineMedium)
                          ],
                        )),
                        Row(
                          children: [
                            SpinnerWidget(
                              items: [
                                'همه',
                                'تکمیل شده',
                                'لغو شده',
                                'درحال پردازش'
                              ],
                              label: 'وضعیت',
                              selectedItem: 'همه',
                            ),
                            const SizedBox(
                              width: spacingThin,
                            ),
                            SearchFieldWidget(
                              controller: _searchController,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: spacingSmall,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.8,
                          mainAxisSpacing: spacingSmall,
                          crossAxisSpacing: spacingSmall,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.go(
                                  '${AppRoutes.orders}/${AppRoutes.orderDetails}');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(radiusSmall),
                                ),
                              padding: container,
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            'شناسه سفارش:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          Text(
                                            '134',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'شماره فاکتور:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                          Text(
                                            '#512356712',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: spacingThin,
                                  ),
                                  Divider(
                                    height: 3,
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  const SizedBox(
                                    height: spacingThin,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.calendar,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.color,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: spacingThin,
                                      ),
                                      Text(
                                        '1403/دی/ 10 یکشنبه 08:13:53',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: spacingThin,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.location,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.color,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: spacingThin,
                                      ),
                                      Text(
                                        'مشهد خیابان شهید بهشتی',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: spacingThin,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.user,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.color,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: spacingThin,
                                      ),
                                      Text(
                                        'سعید غفوری',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      SizedBox(
                                        width: spacingThin,
                                      ),
                                      Text(
                                        '09914038707',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: spacingSmall,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).dividerColor,
                                            borderRadius:
                                            BorderRadius.circular(50)),
                                        child: Row(
                                          children: [
                                            Icon(IconsaxPlusLinear.shopping_cart, size: 20,),
                                            SizedBox(width: spacingThin,),
                                            Text(
                                              '21 قلم',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).dividerColor,
                                            borderRadius:
                                            BorderRadius.circular(50)),
                                        child: Row(
                                          children: [
                                            Icon(IconsaxPlusLinear.refresh_2, size: 17, color: Theme.of(context).textTheme.headlineMedium?.color,),
                                            SizedBox(width: spacingThin,),
                                            Text(
                                              'در انتظار تایید',
                                              style: Theme.of(context).textTheme.headlineMedium,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
