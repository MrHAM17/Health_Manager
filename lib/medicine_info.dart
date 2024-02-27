

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



import 'package:flutter/material.dart';

class MedicineInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Medicine Information'),
      //   backgroundColor: Colors.lightBlue,
      // ),
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
              child: ListView(
                children: [
                  _buildMedicineCard(
                    'Paracetamol',
                    'Used to relieve mild to moderate pain and to reduce fever.',
                  ),
                  SizedBox(height: 10.0),
                  _buildMedicineCard(
                    'Ibuprofen',
                    'Used to relieve pain, swelling, and fever.',
                  ),
                  SizedBox(height: 10.0),
                  _buildMedicineCard(
                    'Aspirin',
                    'Used to treat pain, fever, and inflammation.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add medicine information
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildMedicineCard(String name, String description) {
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
          // Add navigation to medicine details page
        },
      ),
    );
  }
}
