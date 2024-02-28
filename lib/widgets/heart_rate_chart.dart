import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HeartRateSummaryChart extends StatelessWidget {
  final List<double> heartRateData;

  HeartRateSummaryChart({required this.heartRateData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Heart Rate Summary',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          AspectRatio(
            aspectRatio: 1.7,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: heartRateData
                        .asMap()
                        .entries
                        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                        .toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(show: true),
                  ),
                ],
                minX: 0,
                maxX: (heartRateData.length - 1).toDouble(),
                minY: heartRateData.reduce((min, value) => min > value ? value : min) - 5,
                maxY: heartRateData.reduce((max, value) => max < value ? value : max) + 5,
                borderData: FlBorderData(show: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
