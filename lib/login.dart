import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_manager/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left:35, top:130),
              child: Text('Welcome\nBack', style: TextStyle(
                color:Colors.lightBlue,
                fontSize: 33)
              )
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.5,
                      right: 35,
                      left:35),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){}, child:Text('Forgot Password?') )),
                      ElevatedButton(onPressed: (){}, child: Text('Login'),),
                      Align(
                        alignment: Alignment.center,
                        child:Column(
                          children: [
                            Text("Don't have an account?"),
                            Align(alignment: Alignment.center,child: TextButton(onPressed: (){
                              Navigator.push( context, MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                                  );

                            }, child:Text('Register here') )),


                          ],
                        )
                      )


                    ],

                  )

                ),
              )
          ],
        )
      ),

    );

  }
}
