import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
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
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
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
    );
  }
}
