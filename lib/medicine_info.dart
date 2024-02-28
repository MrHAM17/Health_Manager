

//  Way 1...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.medical_services, size: 100.0, color: Colors.lightBlue),
//           SizedBox(height: 20.0),
//           Text(
//             'Medicine Information',
//             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'View information about your medicines here',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }
// }





//  Way 2 ...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicine Information'),
//         backgroundColor: Colors.lightBlue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.medical_services, size: 100.0, color: Colors.lightBlue),
//             SizedBox(height: 20.0),
//             Text(
//               'Medicine Information',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.0),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildMedicineCard(
//                     'Paracetamol',
//                     'Used to relieve mild to moderate pain and to reduce fever.',
//                   ),
//                   SizedBox(height: 10.0),
//                   _buildMedicineCard(
//                     'Ibuprofen',
//                     'Used to relieve pain, swelling, and fever.',
//                   ),
//                   SizedBox(height: 10.0),
//                   _buildMedicineCard(
//                     'Aspirin',
//                     'Used to treat pain, fever, and inflammation.',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMedicineCard(String name, String description) {
//     return Card(
//       elevation: 2.0,
//       child: ListTile(
//         leading: Icon(Icons.medical_services, color: Colors.lightBlue),
//         title: Text(
//           name,
//           style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(description),
//         onTap: () {
//           // Add navigation to medicine details page
//         },
//       ),
//     );
//   }
// }



//  Way 3 ...........................................................................

//
// import 'package:flutter/material.dart';
//
// class MedicineInformation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicine Information'),
//         backgroundColor: Colors.lightBlue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 20.0),
//             Text(
//               'Medicine Information',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.0),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildMedicineCard(
//                     'Paracetamol',
//                     'Used to relieve mild to moderate pain and to reduce fever.',
//                   ),
//                   SizedBox(height: 10.0),
//                   _buildMedicineCard(
//                     'Ibuprofen',
//                     'Used to relieve pain, swelling, and fever.',
//                   ),
//                   SizedBox(height: 10.0),
//                   _buildMedicineCard(
//                     'Aspirin',
//                     'Used to treat pain, fever, and inflammation.',
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Add functionality to add medicine information
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.lightBlue,
//                 padding: EdgeInsets.symmetric(vertical: 15.0),
//               ),
//               child: Text(
//                 'Add Medicine',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMedicineCard(String name, String description) {
//     return Card(
//       elevation: 2.0,
//       child: ListTile(
//         leading: Icon(Icons.medical_services, color: Colors.lightBlue),
//         title: Text(
//           name,
//           style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(description),
//         onTap: () {
//           // Add navigation to medicine details page
//         },
//       ),
//     );
//   }
// }




//  Way 4 ...........................................................................



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_manager/medicine_details.dart';
import 'package:health_manager/medicine_reminder.dart';

class MedicineInformation extends StatefulWidget {


  @override
  State<MedicineInformation> createState() => _MedicineInformationState();
}

class _MedicineInformationState extends State<MedicineInformation> {
  List medicines = [];

  @override
  void initState() {
    getmediData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Medicine Information',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: RefreshIndicator(

                onRefresh: getmediData,
                child: ListView.builder(itemCount:medicines.length,itemBuilder: (context,index) {
                  var days = medicines[index]['selectedDays'];
                  var time = medicines[index]['selectedTimes'];
                  return _buildMedicineCard(medicines[index]['name'],'Days: ${days.join('-')} , \n Time:${time.join('-')}',medicines[index]);
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicineDetails()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );

  }

  Widget _buildMedicineCard(String name, String description,var data) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Icon(Icons.medical_services, color: Colors.lightBlue),
        title: Text(
          name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails(medicineRecord: data)));
        },
      ),
    );
  }

  Future<void> getmediData() async {
    setState(() {
      medicines = [];
    });
    var data = await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('medicines').get();
    data.docs.forEach((element) {
      setState(() {
        medicines.add(element.data());
      });

    });
  }
}
