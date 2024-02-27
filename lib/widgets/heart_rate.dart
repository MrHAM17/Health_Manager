
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartRateWidget extends StatelessWidget {
  final int heartRate;

  const HeartRateWidget({Key? key, required this.heartRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 48.0,
          ),
          SizedBox(width: 8.0),
          Text(
            '$heartRate bpm', // Display the heart rate with "bpm" (beats per minute)
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