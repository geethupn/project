//import 'dart:js';

import 'dart:async';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
//import 'package:flutter_application_1/modules/auth_screens/Register.dart';
import 'package:flutter_application_1/modules/auth_screens/registerpage.dart';
import 'package:flutter_application_1/modules/user/Button.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  void initState(){
  super.initState();
  Future.delayed(const Duration(seconds: 3),(){
    Timer(const Duration(seconds: 1),()=> check());
  //Timer(Duration(seconds: 1),()=>check());
   // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>Button()));

  });

}
check()async{
   SharedPreferences preferences=await SharedPreferences.getInstance();
   String? name=preferences.getString('isloggin');
   if(name!=null)
   {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
   }
   else
   {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
   }
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(52, 105, 47, 73),
      
     body: Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
       // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/new.png",
          ),
        ),
      ),
      ),
     )
     );
      
      
    
  }
}