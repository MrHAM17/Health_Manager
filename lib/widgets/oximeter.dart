import 'package:flutter/material.dart';

class OximeterWidget extends StatelessWidget {
  final double oxygenLevel;

  const OximeterWidget({Key? key, required this.oxygenLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bubble_chart_rounded,
            color: Colors.blue,
            size: 50.0,
          ),
          SizedBox(height: 8.0),
          Text(
            '${oxygenLevel.toStringAsFixed(1)}% SpO2', // Display the oxygen level with "% SpO2"
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
