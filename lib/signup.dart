import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_manager/login.dart';
import 'package:health_manager/user_details.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hive/hive.dart';

import 'main.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final namecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final mailcontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  int? daycontroller;
  int? monthcontroller;
  int? yearcontroller;

  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.lightBlue[50], // Background color set to light blue
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Join us to access our healthcare services!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value == '') {
                      return "Please enter name.";
                    }
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: DropdownButtonFormField<int>(
                        validator: (value) {
                          if (value == null) {
                            return "Please select Date";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Day',
                          border: OutlineInputBorder(),
                        ),
                        items: _generateNumbersList(1, 31).map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            daycontroller = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: DropdownButtonFormField<int>(
                        validator: (value) {
                          if (value == null) {
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Month',
                          border: OutlineInputBorder(),
                        ),
                        items: _generateNumbersList(1, 12).map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          monthcontroller = value;
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: DropdownButtonFormField<int>(
                        validator: (value) {
                          if (value == null) {
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Year',
                          border: OutlineInputBorder(),
                        ),
                        items: _generateYearsList().map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          yearcontroller = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: mailcontroller,
                  validator: (value) {
                    if (value == '' || !EmailValidator.validate(value!)) {
                      return "Enter valid Email";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value) {
                    if (value == '' || value!.length <= 8) {
                      return "please Enter strong password ";
                    }
                  },
                  obscureText: ishidden,
                  controller: pwdcontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ishidden = !ishidden;
                          });
                        },
                        icon: Icon(ishidden
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Handle sign up
                      // After successful sign up, navigate to UserDetailsPage
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ));
                        try {
                          DateTime dob = DateTime(yearcontroller!,
                              monthcontroller!, daycontroller!, 0, 0, 0);
                          var name = namecontroller.text.trim();
                          var email = mailcontroller.text.trim();
                          var pwd = pwdcontroller.text.trim();
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email, password: pwd).then((value) async {
                                final docRef = FirebaseFirestore.instance.collection('Users');
                                var box = Hive.box('UserBox');
                                box.put('name', name);
                                box.put('email', email);
                                box.put('dob', dob);
                                await docRef.doc(value.user?.uid).set({
                                  'name': name,
                                  'email': email,
                                  'id':value.user?.uid,
                                });
                              });
                          Navigator.pop(context);
                        } catch (e) {
                          print('Error: ' + e.toString());
                          // snackbarKey.currentState
                          //     ?.showSnackBar(SnackBar(content: Text(e.toString())));
                          Navigator.pop(context);
                        }
                        Navigator.pop(context);
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Best shape for the button
                      ),
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0), // Button color set to blue
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment
                      .bottomCenter, // Align at the bottom center of the screen
                  child: InkWell(
                    onTap: () {
                      // Navigate to sign in page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an account? Sign In',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<int> _generateNumbersList(int start, int end) {
    return List<int>.generate(end - start + 1, (index) => start + index);
  }

  List<int> _generateYearsList() {
    int currentYear = DateTime.now().year;
    return List<int>.generate(100, (index) => currentYear - index);
  }
}
