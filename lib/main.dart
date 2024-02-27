import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_manager/login.dart';
import 'package:health_manager/user_details.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'firebase_options.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('UserBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot) {
        if(snapshot.hasData){
          return FutureBuilder(future: implementFlow(), builder: (context,futuresnapshot) {
            if(futuresnapshot.hasData){
              if(futuresnapshot.data!.containsKey('condition')){
                return HomePage();
              }else{
                return UserDetailsPage();
              }
            }else{
              return Container(child: Center(child: CircularProgressIndicator(),),);
            }
          });
        }else{
          return LoginScreen();
        }
      }),

    );
  }
  Future<Map<String, dynamic>?> implementFlow() async {
    var user = await FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance.collection('Users').doc(
        user?.uid).get();
    var userdata = data.data();
    return userdata;
  }
}

final GlobalKey<ScaffoldMessengerState> snackbarKey =
GlobalKey<ScaffoldMessengerState>();



