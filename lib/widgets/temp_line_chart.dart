import 'package:co2app/providers/data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TempLineChartWidget extends StatelessWidget {
  final List<Co2Data> points;
  final int period;

  const TempLineChartWidget(this.points, this.period, {Key? key})
      : super(key: key);

  Widget _bottomTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
    );
    var text = DateFormat("HH:mm").format(points[value.toInt()].date);
    if (value.toInt() > points.length - 3) {
      text = "";
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  int _getInterval(dynamic context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 400) return 150;
    if (width < 600) return 120;
    if (width < 900) return 90;
    if (width < 1200) return 60;
    return 30;
  }

  Widget _leftTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
    );
    String text = '';
    switch (value.toInt()) {
      case 5:
        text = "5";
        break;
      case 10:
        text = '10';
        break;
      case 15:
        text = '15';
        break;
      case 20:
        text = '20';
        break;
      case 25:
        text = '25';
        break;
      case 30:
        text = '30';
        break;
      case 35:
        text = '35';
        break;
      case 40:
        text = '40';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  double _getMaxTempValue() {
    var max = points.reduce((c, n) => c.temp > n.temp ? c : n).temp.toDouble();
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return AspectRatio(
          aspectRatio: orientation == Orientation.portrait ? 2 : 3,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
              top: 20,
              bottom: 5,
            ),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: points
                        .map(
                          (point) => FlSpot(
                            points.indexOf(point).toDouble(),
                            point.temp.toDouble(),
                          ),
                        )
                        .toList(),
                    barWidth: 4,
                    isCurved: false,
                    dotData: FlDotData(show: false),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
                minY: 0,
                maxY: _getMaxTempValue() + 10,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: _getInterval(context).toDouble(),
                        reservedSize: 50,
                        getTitlesWidget: _bottomTitleWidget),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        reservedSize: 50,
                        getTitlesWidget: _leftTitleWidget),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        reservedSize: 50,
                        getTitlesWidget: _leftTitleWidget),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: _getInterval(context).toDouble(),
                  checkToShowHorizontalLine: (double value) {
                    return value == 5 ||
                        value == 10 ||
                        value == 15 ||
                        value == 20 ||
                        value == 25 ||
                        value == 30 ||
                        value == 35 ||
                        value == 40;
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}