import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_manager/home.dart';
import 'package:uuid/uuid.dart';

class AddMedicineDetails extends StatefulWidget {
  @override
  _AddMedicineDetailsState createState() => _AddMedicineDetailsState();
}

class _AddMedicineDetailsState extends State<AddMedicineDetails> {
  String _alarmName = '';
  List<String> _selectedDays = [];
  List<String> _selectedTimes = [];

  Future<void> _addMedicine() async {
    var docRef = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid);
    String uniqueId = Uuid().v4();
    await docRef.collection('medicines').doc(uniqueId).set({'id':uniqueId,'name': _alarmName,'selectedDays': _selectedDays,'selectedTimes': _selectedTimes});
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Medicine Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Medicine Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _alarmName = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Select Day(s):'),
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
              onPressed: _addMedicine,
              child: Text('Add Medicine Details'),
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
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            _selectedDays.add(day);
          } else {
            _selectedDays.remove(day);
          }
        });
      },
    );
  }

  Widget _buildTimeChip(String time) {
    final isSelected = _selectedTimes.contains(time);

    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            _selectedTimes.add(time);
          } else {
            _selectedTimes.remove(time);
          }
        });
      },
    );
  }
}