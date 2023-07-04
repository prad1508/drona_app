import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CoachBarChart extends StatefulWidget {
  const CoachBarChart({super.key});

  final Color leftBarColor = Colors.yellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.orange;

  @override
  State<StatefulWidget> createState() => CoachBarChartState();
}

class CoachBarChartState extends State<CoachBarChart> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 0.3, 0.6, 0.4);
    final barGroup2 = makeGroupData(1, 0.2, 0.4, 0.4);
    final barGroup3 = makeGroupData(2, 0.5, 0.4, 0.2);
    final barGroup4 = makeGroupData(3, 0.7, 0.7, 0.0);
    final barGroup5 = makeGroupData(4, 0.3, 0.4, 0.3);
    final barGroup6 = makeGroupData(5, 0.4, 0.5, 0.3);
    final barGroup7 = makeGroupData(6, 0.45, 0.55, 0.1);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 500,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sessions',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'View More',
                        style: TextStyle(
                            fontSize: 21,
                            color: Color.fromRGBO(42, 98, 184, 1)),
                      ),
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
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(104, 203, 157, 1),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Scheduled',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 20),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 123, 114, 1),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const SizedBox(width: 10),
                    const Text('Closed',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    SizedOverflowBox(
                      size: const Size(20, 100),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(270 / 360),
                          child: Text(
                            "(Number os Sessions)",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                                height: 2.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .35,
                      width: MediaQuery.sizeOf(context).width * .85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                barTouchData: BarTouchData(
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.grey,
                                    getTooltipItem: (a, b, c, d) => null,
                                  ),
                                  touchCallback: (FlTouchEvent event, response) {
                                    if (response == null ||
                                        response.spot == null) {
                                      setState(() {
                                        touchedGroupIndex = -1;
                                        showingBarGroups = List.of(rawBarGroups);
                                      });
                                      return;
                                    }

                                    touchedGroupIndex =
                                        response.spot!.touchedBarGroupIndex;

                                    setState(() {
                                      if (!event.isInterestedForInteractions) {
                                        touchedGroupIndex = -1;
                                        showingBarGroups = List.of(rawBarGroups);
                                        return;
                                      }
                                      showingBarGroups = List.of(rawBarGroups);
                                      if (touchedGroupIndex != -1) {
                                        var sum = 0.0;
                                        for (final rod
                                            in showingBarGroups[touchedGroupIndex]
                                                .barRods) {
                                          sum += rod.toY;
                                        }
                                        final avg = sum /
                                            showingBarGroups[touchedGroupIndex]
                                                .barRods
                                                .length;

                                        showingBarGroups[touchedGroupIndex] =
                                            showingBarGroups[touchedGroupIndex]
                                                .copyWith(
                                          barRods:
                                              showingBarGroups[touchedGroupIndex]
                                                  .barRods
                                                  .map((rod) {
                                            return rod.copyWith(
                                                toY: avg, color: widget.avgColor);
                                          }).toList(),
                                        );
                                      }
                                    });
                                  },
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
                                      getTitlesWidget: bottomTitles,
                                      reservedSize: 42,
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 28,
                                      interval: 1,
                                      getTitlesWidget: leftTitles,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingBarGroups,
                                gridData: FlGridData(show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 4,
                                  getDrawingHorizontalLine: (value) {
                                    return const FlLine(
                                      color: Colors.black12,
                                      strokeWidth: 1,
                                    );
                                  },
                                ),

                              ),
                            ),
                          ),
                          Text(
                            '(Coaches Name)',
                            style: TextStyle(
                                height: 0.01, color: Colors.grey.shade600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          )
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

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromRGBO(153, 160, 171, 1),
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 4) {
      text = '10';
    } else if (value == 8) {
      text = '20';
    } else if (value == 12) {
      text = '30';
    } else if (value == 16) {
      text = '40';
    } else if (value == 20) {
      text = '50';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'John',
      'Amit',
      'Param',
      'Sunny',
      'Akshay',
      'Amit',
      'Itish'
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color.fromRGBO(153, 160, 171, 1),
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double s1, double s2, double s3) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: 20,
          // color: widget.leftBarColor,
          gradient: LinearGradient(
            colors: const [
              Color.fromRGBO(104, 203, 157, 1),
              Color.fromRGBO(244, 123, 114, 1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp,
            stops: [s1, s2],
          ),
          width: 8,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
