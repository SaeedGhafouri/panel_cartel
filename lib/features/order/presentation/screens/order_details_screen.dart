import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/commadbar_main.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_row_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/header_main.dart';
import '../../../product/presentation/widgets/status_popup_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final double? orderId;
  const OrderDetailsScreen({super.key, this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarMain(),
          Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: containerHorizontal),
                child: Column(
                  children: [
                    HeaderMain(
                      title: 'جزئیات سفارش',
                      crumbs: const ['داشبورد', 'سفارشات', 'جزئیات سفارش'],
                    ),
                    FormWidget(
                        body: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: 'سفارش',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          TextSpan(
                                              text: ' : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          TextSpan(
                                              text: '#5513253',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium
                                                      ?.color)),
                                        ])),
                                    const SizedBox(height: 10),
                                    Text(
                                      'شناسه سیستمی: 12451',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: '(24 روز پیش)',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium
                                                      ?.color)),
                                          const TextSpan(text: '  '),
                                          TextSpan(
                                            text: '13:42:21 - 1403/03/21 ',
                                            style:
                                            Theme.of(context).textTheme.titleMedium,
                                          ),
                                        ])),
                                    const SizedBox(height: spacingSmall),
                                    Row(
                                      children: [
                                        CommadbarWidget(
                                          text: 'پیوست ها (2)',
                                          icon: IconsaxPlusLinear.attach_square,
                                          onPressed: () {},
                                        ),
                                        StatusPopupWidget(),
                                        CommadbarWidget(
                                          text: 'امضای مشتری',
                                          icon: IconsaxPlusLinear.pen_tool,
                                          onPressed: () {},
                                        ),
                                        CommadbarWidget(
                                          text: 'خروجی',
                                          icon: IconsaxPlusLinear.printer,
                                          onPressed: () {},
                                        ),
                                        CommadbarWidget(
                                          text: 'بروز رسانی',
                                          icon: IconsaxPlusLinear.refresh_2,
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: spacingThin,
                            ),
                            Divider(
                              height: 2,
                              color: Theme.of(context).dividerColor,
                            ),
                            const SizedBox(
                              height: spacingSmall,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'وضعیت سفارش',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        const SizedBox(
                                          height: spacingSmall,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(7),
                                              border: Border.all(
                                                  color: Colors.orangeAccent,
                                                  width: 1.5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  IconsaxPlusLinear.warning_2,
                                                  color: Colors.orangeAccent,
                                                  size: 25,
                                                ),
                                                const SizedBox(width: spacingThin),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'نظارت دقیق بر وضعیت سفارشات',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium
                                                          ?.copyWith(
                                                          color: Colors
                                                              .orangeAccent),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    SizedBox(
                                                      width: 320,
                                                      child: Text(
                                                        'کارشناس مسئول باید به طور منظم و به‌موقع وضعیت سفارشات را بررسی کند.عدم توجه به این موضوع می‌تواند منجر به\n'
                                                            'نارضایتی مشتریان و کاهش کیفیت خدمات گردد.',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineMedium,
                                                        softWrap: true,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                const Expanded(flex: 3, child: Column()),
                                Expanded(
                                  flex: 4,
                                  child: EasyStepper(
                                    activeStep: 3,
                                    stepShape: StepShape.rRectangle,
                                    activeStepBorderType: BorderType.normal,
                                    defaultStepBorderType: BorderType.normal,
                                    stepBorderRadius: 15,
                                    borderThickness: 0,
                                    padding: container,
                                    stepRadius: 28,
                                    finishedStepBorderColor: primaryColor,
                                    finishedStepTextColor: primaryColor,
                                    activeStepTextColor: primaryColor,
                                    activeStepIconColor: primaryColor,
                                    finishedStepBackgroundColor:
                                    primaryColor.withOpacity(0.1),
                                    finishedStepIconColor: primaryColor,
                                    lineStyle: const LineStyle(
                                      lineType: LineType.dashed,
                                    ),
                                    steps: const [
                                      EasyStep(
                                        icon: Icon(IconsaxPlusLinear.refresh_2),
                                        activeIcon: Icon(IconsaxPlusBold.refresh_2),
                                        title: 'در انتظار تأیید',
                                      ),
                                      EasyStep(
                                        icon: Icon(IconsaxPlusLinear.card_tick),
                                        activeIcon: Icon(IconsaxPlusBold.refresh_2),
                                        title: 'تأیید شده',
                                      ),
                                      EasyStep(
                                        icon: Icon(
                                            IconsaxPlusLinear.refresh_square_2),
                                        activeIcon: Icon(IconsaxPlusBold.refresh_2),
                                        title: 'در حال پردازش',
                                      ),
                                      EasyStep(
                                        icon: Icon(IconsaxPlusLinear.truck_tick),
                                        activeIcon: Icon(IconsaxPlusBold.refresh_2),
                                        title: 'آماده برای ارسال',
                                      ),
                                      EasyStep(
                                        icon: Icon(IconsaxPlusLinear.tick_circle),
                                        activeIcon: Icon(IconsaxPlusBold.refresh_2),
                                        title: 'ارسال شده',
                                      ),
                                    ],
                                    onStepReached: (index) {
                                      /*setState(() {
                                    _activeStep = index; /
                                  });*/
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: spacingSmall),
                            Divider(
                              height: 1,
                              color: Theme.of(context).dividerColor,
                            ),
                            const SizedBox(height: spacingSmall),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TODO Order Info
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'جزئیات سفارش',
                                          style:
                                          Theme.of(context).textTheme.bodySmall,
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Invoice Id
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'شناسه سفارش:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '#5513253',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Order Id
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'شناسه سیستمی:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '12451',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Date
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'تاریخ ثبت:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              ' 1403/03/21 13:42:21',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                const SizedBox(width: spacingMedium),
                                /// TODO Person Info
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اطلاعات مشتری',
                                          style:
                                          Theme.of(context).textTheme.bodySmall,
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// User full name
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'نام و نام خانوادگی:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              'سید سعید غفوری',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Phone
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'شماره موبایل:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '09914038707',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Email
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'ایمیل:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              'saeedghafoori1@gmail.com',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// National Code
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'کد ملی:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '4900986682',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                const SizedBox(width: spacingMedium),
                                /// TODO Address Info
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'اطلاعات آدرس',
                                          style:
                                          Theme.of(context).textTheme.bodySmall,
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// User full name
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'نام و نام خانوادگی:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              'سید سعید غفوری',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Phone
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'شماره موبایل:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '09914038707',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// Email
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'ایمیل:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              'saeedghafoori1@gmail.com',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: spacingThin,
                                        ),
                                        /// National Code
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: spacingThin,
                                                ),
                                                Text(
                                                  'کد ملی:',
                                                  style: Theme.of(context).textTheme.headlineMedium,
                                                ),
                                              ],
                                            ),

                                            Text(
                                              '4900986682',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: spacingSmall,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Products
                        const Expanded(
                          flex: 6,
                          child: FormWidget(
                              body: Column(
                                children: [
                                  TableHeaderWidget(title: 'اقلام سفارش', isTable: true,),
                                  TableRowWidget(rowTitles: ['نام', 'تعداد', 'قیمت واحد', 'مبلغ کل', '#']),
                                ],
                              )
                          ),
                        ),
                        const SizedBox(width: spacingSmall,),
                        ///
                        Expanded(
                          flex: 4,
                          child: FormWidget(
                              body: Column(
                                children: [
                                  const TableHeaderWidget(title: 'مشخصات پرداخت', isTable: false,),
                                  SizedBox(height: spacingSmall,),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    color: Colors.greenAccent.withOpacity(0.2),
                                                    borderRadius: smallRadius
                                                ),
                                                child: Center(
                                                  child: Icon(IconsaxPlusLinear.money, color: Colors.greenAccent, size: 30,),
                                                ),
                                              ),
                                              SizedBox(height: spacingThin,),
                                              Text('تسویه شده')
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: spacingSmall,),
                                  Divider(height: 1, color: Theme.of(context).dividerColor,),
                                  const TableRowWidget(rowTitles: ['مبلغ کل', 'مبلغ تخفیف', 'مبلغ نهایی', 'نوع پرداخت', 'شماره پیگیری']),
                                ],
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
