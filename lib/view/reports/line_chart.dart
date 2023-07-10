import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );


  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(153, 160, 171, 1),
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '00';
        break;
      case 1:
        text = '10';
        break;
      case 2:
        text = '20';
        break;
      case 3:
        text = '30';
        break;
      case 4:
        text = '40';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(153, 160, 171, 1),
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 3:
        text = const Text('Feb', style: style);
        break;
      case 5:
        text = const Text('Mar', style: style);
        break;
      case 7:
        text = const Text('Apr', style: style);
        break;
      case 9:
        text = const Text('May', style: style);
        break;
      case 11:
        text = const Text('Jun', style: style);
        break;
      case 13:
        text = const Text('Jul', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: false,
        color: const Color.fromRGBO(71, 192, 136, 1),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 1),
          FlSpot(3, 2.5),
          FlSpot(5, 1.7),
          FlSpot(7, 3.4),
          FlSpot(10, 3),
          FlSpot(12, 3.2),
          FlSpot(13, 2.8),
          FlSpot(14, 2.4),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: false,
        color: const Color.fromRGBO(42, 98, 184, 1),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: AppColors.contentColorPink.withOpacity(0),
        ),
        spots: const [
          FlSpot(0, 1.2),
          FlSpot(3, 3.3),
          FlSpot(7, 2.2),
          FlSpot(10, 3.8),
          FlSpot(12, 3.6),
          FlSpot(13, 4.9),
          FlSpot(14, 4.4),
        ],
      );
}

class LineChartDrona extends StatefulWidget {
  const LineChartDrona({super.key});

  @override
  State<StatefulWidget> createState() => LineChartDronaState();
}

class LineChartDronaState extends State<LineChartDrona> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          height: 330,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedOverflowBox(
                size: Size(20, 100),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(270 / 360),
                    child: Text(
                      "Rupees in Thousand",
                      style: TextStyle(
                          color: Color.fromRGBO(153, 160, 171, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 2.5),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(42, 98, 184, 1),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Billed',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 20),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(71, 192, 136, 1),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(width: 10),
                        const Text('Collected',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 280,
                    width: MediaQuery.sizeOf(context).width * .88,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: _LineChart(isShowingMainData: isShowingMainData),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Months',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 0.5, color: Color.fromRGBO(153, 160, 171, 1)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
                          ),
                          onPressed: () {
                            setState(() {
                              isShowingMainData = !isShowingMainData;
                            });
                          },
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
