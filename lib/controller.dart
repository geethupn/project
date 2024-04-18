import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/LoginPage.dart';
import 'package:flutter_application_1/modules/user/Register.dart';
//import 'package:flutter_application_1/modules/user/Register.dart';
//import 'package:flutter_application_1/modules/user/loginpage.dart';

class Controlprovider{
  CreateAccount({required String emailAddress,required String password,context})
  async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  ).then((value){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);});
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
  VerifyAccount({required String emailAddress,required String password,context})
  async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  ).then((value){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);});
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

}