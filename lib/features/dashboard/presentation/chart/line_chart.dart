import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:panel_cartel/core/themes/themes.dart';
import 'package:panel_cartel/core/widgets/datagrid/table_header_widget.dart';
import 'package:panel_cartel/core/widgets/form_widget.dart';
import 'package:panel_cartel/core/widgets/spinner_widget.dart';

import '../../../../core/constants/responsive.dart';

class LineChartCard extends StatelessWidget {
  LineChartCard({super.key});

  final List<FlSpot> spots = const [
    FlSpot(1.68, 21.04),
    FlSpot(2.84, 26.23),
    FlSpot(5.19, 19.82),
    FlSpot(6.01, 24.49),
    FlSpot(7.81, 19.82),
    FlSpot(9.49, 23.50),
    FlSpot(12.26, 19.57),
    FlSpot(15.63, 20.90),
    FlSpot(20.39, 39.20),
    FlSpot(23.69, 75.62),
    FlSpot(26.21, 46.58),
    FlSpot(29.87, 42.97),
    FlSpot(32.49, 46.54),
    FlSpot(35.09, 40.72),
    FlSpot(38.74, 43.18),
    FlSpot(41.47, 59.91),
    FlSpot(43.12, 53.18),
    FlSpot(46.30, 90.10),
    FlSpot(47.88, 81.59),
    FlSpot(51.71, 75.53),
    FlSpot(54.21, 78.95),
    FlSpot(55.23, 86.94),
    FlSpot(57.40, 78.98),
    FlSpot(60.49, 74.38),
    FlSpot(64.30, 48.34),
    FlSpot(67.17, 70.74),
    FlSpot(70.35, 75.43),
    FlSpot(73.39, 69.88),
    FlSpot(75.87, 80.04),
    FlSpot(77.32, 74.38),
    FlSpot(81.43, 68.43),
    FlSpot(86.12, 69.45),
    FlSpot(90.06, 78.60),
    FlSpot(94.68, 46.05),
    FlSpot(98.35, 42.80),
    FlSpot(101.25, 53.05),
    FlSpot(103.07, 46.06),
    FlSpot(106.65, 42.31),
    FlSpot(108.20, 32.64),
    FlSpot(110.40, 45.14),
    FlSpot(114.24, 53.27),
    FlSpot(116.60, 42.13),
    FlSpot(118.52, 57.60),
  ];

  final leftTitle = {
    0: '0',
    20: '05',
    40: '10',
    60: '15',
    80: '20',
    100: '25'
  };
  final bottomTitle = {
    0: 'فروردین',
    10: 'اردیبهشت',
    20: 'خرداد',
    30: 'تیر',
    40: 'مرداد',
    50: 'شهریور',
    60: 'مهر',
    70: 'آبان',
    80: 'آذر',
    90: 'دی',
    100: 'بهمن',
    110: 'اسفند',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableHeaderWidget(
          title: 'سفارشات اخیر',
          startChildren: [
            SpinnerWidget(
              selectedItem: 'هفتگی',
              onChanged: (value) {},
              label: 'هفتگی',
              items: const [
                'هفتگی',
                'ماهانه',
                'سالانه'
              ],
            )
          ],
        ),
        const SizedBox(
          height: spacingSmall,
        ),
        AspectRatio(
          aspectRatio: Responsive.isMobile(context) ? 9 / 4 : 16 / 6,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
              ),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 1,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return bottomTitle[value.toInt()] != null
                          ? SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: Text(
                            bottomTitle[value.toInt()].toString(),
                            style: TextStyle(
                                fontSize: Responsive.isMobile(context)
                                    ? 9
                                    : 12,
                                color: Colors.grey[400])),
                      )
                          : const SizedBox();
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return leftTitle[value.toInt()] != null
                          ? Text(leftTitle[value.toInt()].toString(),
                          style: TextStyle(
                              fontSize:
                              Responsive.isMobile(context) ? 9 : 12,
                              color: Colors.grey[400]))
                          : const SizedBox();
                    },
                    showTitles: true,
                    interval: 1,
                    reservedSize: 40,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                    isCurved: true,
                    curveSmoothness: 0,
                    color: Theme.of(context).primaryColor,
                    barWidth: 2.5,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Colors.transparent
                        ],
                      ),
                      show: true,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    dotData: FlDotData(show: false),
                    spots: spots)
              ],
              minX: 0,
              maxX: 120,
              maxY: 105,
              minY: -5,
            ),
            duration: const Duration(milliseconds: 250),
          ),
        ),
      ],
    );
  }
}