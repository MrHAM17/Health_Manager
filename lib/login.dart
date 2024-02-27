import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_manager/auth_methods.dart';
import 'package:health_manager/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

void loginUser() async {
  setState(() {
    _isLoading = true;
  });
  String res = await AuthMethods().loginUser(
    email: _emailController.text,
    password:_passwordController.text,
  );
  if(res == "success"){
  Text('Login Successful');
  }else{
    setState(() {
      _isLoading = false;
    });

    final snackBar = SnackBar(
      content: Text('Login failed. Please check your credentials.'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  // setState(() {
  //   _isLoading = false;
  // });

}



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
                      TextFormField(
                        controller: _emailController,
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
                      TextFormField(
                        controller: _passwordController,
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
                      ElevatedButton(onPressed: loginUser, child: Text('Login'),),
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
