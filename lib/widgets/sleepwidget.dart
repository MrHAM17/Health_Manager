import 'package:flutter/material.dart';

class SleepWidget extends StatelessWidget {
  final double hours;

  const SleepWidget({Key? key, required this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.nightlight_round,
            color: Colors.purple,
            size: 48.0,
          ),
          SizedBox(height: 8.0),
          Text(
            '$hours hours',
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
