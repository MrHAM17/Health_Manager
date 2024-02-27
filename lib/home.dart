import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'medicine_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttom Navigation Bar',
      home: Scaffold(
        appBar: AppBar(title: Text('HEALTH APP'),),
        body: [
          Center(
            child: Text(
              'Home ',
            ),
          ),
          MedicineInformation(),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('USER NAME', style: TextStyle(fontSize: 22)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [Colors.lightBlue, Colors.white],
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  height: 120,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                        ),
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '120 cm',
                          style: TextStyle(fontSize: 22),
                        ),
                      ]),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Column(children: [
                        Icon(Icons.weekend_outlined),
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '100 kg',
                          style: TextStyle(fontSize: 22),
                        ),
                      ]),
                    ],
                  ),
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                        height: MediaQuery.of(context).size.height * 0.56,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.lightBlue, Colors.white],
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Column(

                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical:15),
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text('Edit Profile'),
                                        Spacer(),
                                        Icon(CupertinoIcons.arrow_right)
                                      ],
                                    ))),
                            Container(
                                margin: EdgeInsets.symmetric(vertical:15),
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text('Help'),
                                        Spacer(),
                                        Icon(CupertinoIcons.arrow_right)
                                      ],
                                    ))),
                            Container(
                                margin: EdgeInsets.symmetric(vertical:15),
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text('FAQ'),
                                        Spacer(),
                                        Icon(CupertinoIcons.arrow_right)
                                      ],
                                    ))),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text('Sign Out'),
                                      Spacer(),
                                      Icon(CupertinoIcons.arrow_right)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.medical_information),
              icon: Icon(Icons.medical_information),
              label: 'Medication',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}