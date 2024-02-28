import 'package:flutter/material.dart';
import 'package:health_manager/widgets/heart_rate_chart.dart';

class HeartActivityScreen extends StatefulWidget {
  const HeartActivityScreen({super.key});

  @override
  State<HeartActivityScreen> createState() => _HeartActivityScreenState();
}

class _HeartActivityScreenState extends State<HeartActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeartRateSummaryChart(heartRateData: [60, 65, 70, 75, 80, 85, 90]),
        ],
      ),
    );
  }
}
