import 'package:flutter/material.dart';

import 'medicine.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 1; // Index of the currently selected tab
//
//   // Define the pages for each tab
//   final List<Widget> _pages = [
//     // Add your MedicationPage widget here
//     Placeholder(),
//     // Add your HomePage widget here
//     Placeholder(),
//     // Add your ProfilePage widget here
//     Placeholder(),
//   ];
//
//   // Handle bottom navigation bar item selection
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Health Manager',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         centerTitle: true, // Align title in the center
//         backgroundColor: Colors.lightBlue,
//         elevation: 0, // Remove the app bar shadow
//       ),
//       body: AnimatedSwitcher(
//         duration: Duration(milliseconds: 300),
//         child: _pages[_selectedIndex], // Show the selected page
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.lightBlue,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(0.5),
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         // Customize bottom navigation bar items
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medication_rounded, size: 28),
//             label: 'Medication',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_rounded, size: 28),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_rounded, size: 28),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Index of the currently selected tab

  // Define the pages for each tab
  final List<Widget> _pages = [
    // Add your MedicationPage widget here
    MedicinePage(),
    // Add your HomePage widget here
    Placeholder(),
    // Add your ProfilePage widget here
    // ProfilePage(),
  ];

  // Handle bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => MedicinePage()));
        break;
      case 1:
      // Home page is already selected, no need to navigate
        break;
      // case 2:
      //   Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfilePage()));
      //   break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Manager',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true, // Align title in the center
        backgroundColor: Colors.lightBlue,
        elevation: 0, // Remove the app bar shadow
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex], // Show the selected page
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Customize bottom navigation bar items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_rounded, size: 28),
            label: 'Medication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
