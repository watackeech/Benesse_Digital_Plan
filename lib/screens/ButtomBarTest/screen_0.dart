import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../palette.dart';

//https://pub.dev/packages/fl_chart

class Screen_0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("テスト４_0"), centerTitle: true, backgroundColor: kPrime,),
      // backgroundColor: kSub1,
      body: ListView(
        itemExtent: 330,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: kSub2,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 0.0,
                  pieTouchData: PieTouchData(enabled: true),
                  sections: [
                    MyPieData(10, "英語", Colors.deepOrange),
                    MyPieData(13, "数学", Colors.blue),
                    MyPieData(15, "国語", Colors.green),
                    MyPieData(8, "化学", Colors.purpleAccent),
                    MyPieData(17, "日本史", Colors.blueGrey),
                  ],
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              color: kSub2,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipMargin: 8,
                      getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                          ) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          TextStyle(
                            color: kPrime,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value, double) => const TextStyle(
                          color: kPrime, fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Mn';
                          case 1:
                            return 'Te';
                          case 2:
                            return 'Wd';
                          case 3:
                            return 'Tu';
                          case 4:
                            return 'Fr';
                          case 5:
                            return 'St';
                          case 6:
                            return 'Sn';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(y: 8, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(y: 10, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(y: 14, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(y: 15, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(y: 13, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(y: 10, colors: _barChartColor)
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<Color> _barChartColor = [kSub4, kSub3];
}

class PieChartCategory extends StatelessWidget {
  final String categoryName;
  PieChartCategory(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      padding: EdgeInsets.all(3),
      child: Text(categoryName, style: TextStyle(
        fontSize: 20,
      ),
      ),
    );
  }
}

PieChartSectionData MyPieData(double figure, String categoryTitle, pieColor) {
  return PieChartSectionData(value: figure, showTitle: true, color: pieColor, radius: 150,
    title: figure.toString(), titleStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    badgeWidget: PieChartCategory(categoryTitle), badgePositionPercentageOffset: .98,
  );
}