import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CircularChartDrona extends StatefulWidget {
  const CircularChartDrona({super.key});

  @override
  State<CircularChartDrona> createState() => _CircularChartDronaState();
}

class _CircularChartDronaState extends State<CircularChartDrona> {
  List<Color> gradientColors = [
    Colors.blue,
    Colors.white,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 365,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profits',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    Text(
                      'Jan, 2023',
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromRGBO(234, 239, 248, 1)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            side: MaterialStateProperty.all(const BorderSide(
                              width: 2,
                              color: Color.fromRGBO(42, 98, 184, 1),
                            )),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {},
                        child: const Text('Service Wise',
                            style: TextStyle(color: Colors.black))),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                const Color.fromRGBO(234, 239, 248, 1)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            side: MaterialStateProperty.all(const BorderSide(
                              width: 2,
                              color: Color.fromRGBO(42, 98, 184, 1),
                            )),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {},
                        child: const Text(
                          'Batch Wise',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SizedOverflowBox(
                        size: Size(20, 100),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(270 / 360),
                            child: Text(
                              "Rupees In Thousand",
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 160, 171, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 2.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .35,
                      width: MediaQuery.sizeOf(context).width * .88,
                      child: Stack(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1.4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                // right: 18,
                                left: 12,
                                top: 24,
                              ),
                              child: LineChart(
                                showAvg ? avgData() : mainData(),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 60,
                          //   height: 34,
                          //   child: TextButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         showAvg = !showAvg;
                          //       });
                          //     },
                          //     child: Text(
                          //       'avg',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: showAvg
                          //             ? Colors.white.withOpacity(0.5)
                          //             : Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color.fromRGBO(153, 160, 171, 1));
    Widget text;
    if (value.toDouble() == 1.5) {
      text = const Text('01-05', style: style);
    } else if (value.toDouble() == 3.0) {
      text = const Text('06-10', style: style);
    } else if (value.toDouble() == 4.5) {
      text = const Text('11-15', style: style);
    } else if (value.toDouble() == 6.0) {
      text = const Text('16-20', style: style);
    } else if (value.toDouble() == 7.5) {
      text = const Text('21-25', style: style);
    } else if (value.toDouble() == 9.0) {
      text = const Text('26-30', style: style);
    } else if (value.toDouble() == 10.5) {
      text = const Text('31', style: style);
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color.fromRGBO(153, 160, 171, 1));
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

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1.5,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
        // getDrawingVerticalLine: (value) {
        //   return const FlLine(
        //     color: Colors.black,
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1.5,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 22,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.black12),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: .5,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: .7,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
