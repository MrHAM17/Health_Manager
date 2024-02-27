import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';



class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }









  Future<void> signOut() async {
    await _auth.signOut();
  }

}