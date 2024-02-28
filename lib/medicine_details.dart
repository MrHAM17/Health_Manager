import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_manager/home.dart';

class MedicineDetails extends StatefulWidget {
  final medicineRecord;

  const MedicineDetails({super.key,required this.medicineRecord});

  @override
  _MedicineDetailsState createState() => _MedicineDetailsState(medicineRecord);
}

class _MedicineDetailsState extends State<MedicineDetails> {
  String _alarmName = '';
  final medicineRecord;
  List<String> _selectedDays = [];
  List<String> _selectedTimes = [];

  _MedicineDetailsState(this.medicineRecord);

  @override
  void initState() {
    _selectedDays.addAll((medicineRecord['selectedDays'] as List<dynamic>).cast<String>());
    _selectedTimes.addAll((medicineRecord['selectedTimes'] as List<dynamic>).cast<String>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Medicine Name: ${medicineRecord['name']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            SizedBox(height: 20),
            Text('Day(s):to Take'),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                _buildDayChip('Monday'),
                _buildDayChip('Tuesday'),
                _buildDayChip('Wednesday'),
                _buildDayChip('Thursday'),
                _buildDayChip('Friday'),
                _buildDayChip('Saturday'),
                _buildDayChip('Sunday'),
              ],
            ),
            SizedBox(height: 20),
            Text('Select Time(s):'),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                _buildTimeChip('Morning'),
                _buildTimeChip('Afternoon'),
                _buildTimeChip('Evening'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirmation"),
                      content: Text("Are you sure you want to delete?"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).collection('medicines').doc(medicineRecord['id']).delete();
                            // Once deletion is done, close the dialog
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                            // Call delete function here
                          }, child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delete',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayChip(String day) {
    final isSelected = _selectedDays.contains(day);

    return FilterChip(
      label: Text(day),
      selected: isSelected, onSelected: (bool value) {  },
    );
  }

  Widget _buildTimeChip(String time) {
    final isSelected = _selectedTimes.contains(time);

    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: (bool value) {},
    );
  }
}