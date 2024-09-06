import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/commadbar_main.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/header_main.dart';

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
          Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
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
                                  TextSpan(text: '  '),
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
                                    CommadbarWidget(
                                      text: 'وضعیت',
                                      icon: IconsaxPlusLinear.quote_up_square,
                                      onPressed: () {},
                                    ),
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
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              IconsaxPlusLinear.warning_2,
                                              color: Colors.orangeAccent,
                                              size: 25,
                                            ),
                                            SizedBox(width: spacingThin),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'نظارت دقیق بر وضعیت سفارشات',
                                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.orangeAccent),
                                                ),
                                                SizedBox(height: 8),
                                                SizedBox(
                                                  width: 320,
                                                  child: Text(
                                                    'کارشناس مسئول باید به طور منظم و به‌موقع وضعیت سفارشات را بررسی کند.عدم توجه به این موضوع می‌تواند منجر به\n'
                                                        'نارضایتی مشتریان و کاهش کیفیت خدمات گردد.',
                                                    style: Theme.of(context).textTheme.headlineMedium,
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
                            Expanded(flex: 3, child: Column()),
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
                                finishedStepBackgroundColor: primaryColor.withOpacity(0.1),
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
                                    icon: Icon(IconsaxPlusLinear.refresh_square_2),
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
                        )
                      ],
                    ))
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
