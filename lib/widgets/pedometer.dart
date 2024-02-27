import 'package:flutter/material.dart';

class PedometerWidget extends StatelessWidget {
  final int steps;

  const PedometerWidget({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_walk,
            color: Colors.orange,
            size: 48.0,
          ),
          SizedBox(height: 8.0),
          Text(
            '$steps steps',
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
