

//  Way 1...........................................................................


import 'package:flutter/material.dart';

import 'medicine_info.dart';
import 'medicine_reminder.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.lightBlue,
    ),
    home: MedicinePage(),
  ));
}

class MedicinePage extends StatefulWidget {
  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Medicine Reminder'),
            Tab(text: 'Medicine Information'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MedicineReminder(),
          MedicineInformation(),
        ],
      ),
    );
  }
}
