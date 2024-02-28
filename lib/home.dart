import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_manager/questionaries.dart';
import 'package:health_manager/widgets/heart_rate.dart';
import 'package:health_manager/widgets/oximeter.dart';
import 'package:health_manager/widgets/pedometer.dart';
import 'package:health_manager/widgets/sleepwidget.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'medicine_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, dynamic>> newsSources;
  int selectedPageIndex = 0;
  late String name;
  late String height;
  late String weight;
  @override
  void initState() {
    var box = Hive.box('UserBox');
    name = box.get('name');
    height = box.get('height');
    weight = box.get('weight');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttom Navigation Bar',
      home: Scaffold(
        appBar: AppBar(elevation: 10, title: Text(getGreeting(name))),
        body: [
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
                child: Text(
                  "Track Your Health",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 12.0,
              //   crossAxisSpacing: 12.0,
              //   padding: EdgeInsets.all(16.0),
              //   children: [
              //     HeartRateWidget(heartRate: 75),
              //     OximeterWidget(oxygenLevel: 98.5),
              //     PedometerWidget(steps: 5000),
              //     SleepWidget(hours: 7),
              //   ],
              // ),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                padding: EdgeInsets.all(16.0),
                children: [
                  HeartRateWidget(heartRate: 75),
                  OximeterWidget(oxygenLevel: 98.5),
                  PedometerWidget(steps: 5000),
                  SleepWidget(hours: 7),
                ],
              ),


            ],
          )),
          MedicineInformation(),
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Icon(
                          Icons.height,
                        ),
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${height} cm',
                          style: TextStyle(fontSize: 22),
                        ),
                      ]),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Column(children: [
                        Icon(Icons.monitor_weight),
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${weight} kg',
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
                        // Container(
                        //     margin: EdgeInsets.symmetric(vertical:15),
                        //     height: 60,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Row(
                        //           children: [
                        //             Text('Edit Profile'),
                        //             Spacer(),
                        //             Icon(CupertinoIcons.arrow_right)
                        //           ],
                        //         ))),
                        // Container(
                        //     margin: EdgeInsets.symmetric(vertical:15),
                        //     height: 60,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Row(
                        //           children: [
                        //             Text('Help'),
                        //             Spacer(),
                        //             Icon(CupertinoIcons.arrow_right)
                        //           ],
                        //         ))),
                        // Container(
                        //     margin: EdgeInsets.symmetric(vertical:15),
                        //     height: 60,
                        //     child: ElevatedButton(
                        //         onPressed: () {},
                        //         child: Row(
                        //           children: [
                        //             Text('FAQ'),
                        //             Spacer(),
                        //             Icon(CupertinoIcons.arrow_right)
                        //           ],
                        //         ))),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                              },
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

  String getGreeting(name) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning! ${name}';
    } else if (hour < 17) {
      return 'Good Afternoon! ${name}';
    } else if (hour < 20) {
      return 'Good Evening! ${name}';
    } else {
      return 'Good Night! ${name}';
    }
  }
}
