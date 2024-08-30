import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/appbar.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';
import '../../../../core/widgets/side_drawer.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth < 600
                  ? 1
                  : constraints.maxWidth < 900
                      ? 2
                      : 4;

              return Column(
                children: [
                  const AppBarMain(),
                  Flexible(
                    child: SingleChildScrollView(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: containerHorizontal, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _buildCardTile(
                                context,
                                title: 'محصولات',
                                count: '721',
                                icon: IconsaxPlusLinear.box,
                              ),
                              const SizedBox(
                                width: spacingSmall,
                              ),
                              _buildCardTile(
                                context,
                                title: 'مشتریان',
                                count: '342',
                                icon: IconsaxPlusLinear.user,
                              ),
                              const SizedBox(
                                width: spacingSmall,
                              ),
                              _buildCardTile(
                                context,
                                title: 'سفارشات',
                                count: '123',
                                icon: IconsaxPlusLinear.shopping_bag,
                              ),
                              const SizedBox(
                                width: spacingSmall,
                              ),
                              _buildWelcomeTile(context),
                            ],
                          ),
                          SizedBox(height: spacingSmall),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        /// TODO FEATURES
                                        Expanded(
                                          flex: 3,
                                          child: _buildFeaturesWidgetTile(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: spacingSmall,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// TODO USER WIDGET
                                        Expanded(
                                          flex: 3,
                                          child: _buildUserWidgetTile(),
                                        ),
                                        const SizedBox(width: spacingSmall),

                                        /// TODO LAST ORDER
                                        Expanded(
                                          flex: 5,
                                          child: _buildLastOrderWidgetTile(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: spacingSmall),

                              /// TODO SERVER
                              Expanded(
                                flex: 3,
                                child: _buildServerWidget(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  )
                ],
              );
            },
          )),
      endDrawer: const SideDrawer(),
    );
  }

  Widget _buildCardTile(
    BuildContext context, {
    required String title,
    required String count,
    required IconData icon,
  }) {
    return Expanded(
      flex: 2,
      child: FormWidget(
        body: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor.withOpacity(0.3),
                borderRadius: smallRadius,
              ),
              child:
                  Icon(icon, size: 30, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    count,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeTile(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            height: 95,
            decoration: BoxDecoration(
              borderRadius: smallRadius,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1152FD),
                  Color(0xFF5E8AFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'آقای سعید غفوری',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  ' به پنل مدیریت خوش آمدید 👋',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'برای آغاز یک مسیر جدید و پر از موفقیت',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ])))
            ])));
  }

  Widget _buildServerWidget() {
    return FormWidget(
        body: Column(children: [
      TableHeaderWidget(
        title: 'وضعیت سرور',
      ),
      SizedBox(height: 10),
      Row(children: [
        Expanded(
            flex: 2,
            child: Column(children: [
              Text(
                'مقدار حجم مصرفی',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 5),
              Text(
                'فضای سرور',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  semanticsLabel: 'CPU',
                  semanticsValue: 'CPU',
                  strokeCap: StrokeCap.round,
                  value: 0.43,
                  backgroundColor: Theme.of(context).dividerColor,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'حجم کل:',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '2 گیگابایت',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                      color: dangerColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'حجم مصرفی:',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '1.41 گیگابایت',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(children: [
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                    color: successColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'حجم باقی مانده:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 5),
                Text(
                  '590 مگابایت',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ]),
              const SizedBox(height: spacingSmall),
              Divider(height: 1, color: Theme.of(context).dividerColor),
              const SizedBox(height: spacingSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'میزان استفاده از CPU',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '1531 MB / 4000 MB',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              const SizedBox(height: spacingThin),
              LinearProgressIndicator(
                borderRadius: largeRadius,
                value: 0.43,
                minHeight: 4,
                backgroundColor:
                    Theme.of(context).dividerColor.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
              const SizedBox(height: spacingSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'میزان پهنای باند مصرفی شبکه',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '1531 MB / 4000 MB',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              const SizedBox(height: spacingThin),
              LinearProgressIndicator(
                borderRadius: largeRadius,
                value: 0.80,
                minHeight: 4,
                backgroundColor:
                    Theme.of(context).dividerColor.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
              const SizedBox(height: spacingSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'میزان استفاده از Swap',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '1531 MB / 4000 MB',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              const SizedBox(height: spacingThin),
              LinearProgressIndicator(
                borderRadius: largeRadius,
                value: 0.20,
                minHeight: 4,
                backgroundColor:
                    Theme.of(context).dividerColor.withOpacity(0.5),
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
              ),
              const SizedBox(height: spacingSmall),
              Divider(height: 1, color: Theme.of(context).dividerColor),
              const SizedBox(height: spacingSmall),
            ]))
      ])
    ]));
  }

  Widget _buildUserWidgetTile() {
    return const FormWidget(
      height: 300,
      body: Column(
        children: [
          TableHeaderWidget(
            title: 'کابران',
          )
        ],
      ),
    );
  }

  Widget _buildLastOrderWidgetTile() {
    return const FormWidget(
      body: Column(
        children: [
          TableHeaderWidget(
            title: 'آمار فروش',
            endChildren: [
              /* SpinnerWidget(
                 items: [
                   'هفته',
                   'ماه',
                   'سال'
                 ],
               )*/
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesWidgetTile() {
    return FormWidget(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuWidgetTile(
                  context,
                  'کارشناسان',
                  IconsaxPlusBroken.user_tick,
                  primaryColor, () {}
              ),


            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuWidgetTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Container(
        height: 100,
        child: InkWell(
            onTap: onPressed,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor.withOpacity(0.3),
                  borderRadius: smallRadius,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),
              SizedBox(
                height: spacingThin,
              ),
              Text(title)
            ])));
  }
}
