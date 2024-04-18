import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:google_fonts/google_fonts.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<Register> {
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController phonenumber=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmpass=TextEditingController();
  Controlprovider obj1=Controlprovider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"),fit: BoxFit.cover,
            ),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: username,
                        decoration: InputDecoration(
                          
                          labelText: "Username",
                          labelStyle:GoogleFonts.inder(), 
                        
                        ),
                        
                      ),
                      SizedBox(height: 10,),
                        TextField(
                          controller: email,
                        decoration: InputDecoration(
                          
                          labelText: "Email",
                          labelStyle: GoogleFonts.inder(),
                        
                        ),
                        
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: age,
                        decoration: InputDecoration(
                          
                          labelText: "Age",
                          labelStyle: GoogleFonts.inder(),
                        
                        
                        ),
                        
                      ),
                      SizedBox(height: 10,),
                        TextField(
                          controller: phonenumber,
                        decoration: InputDecoration(
                          
                          labelText: "Phone Number",
                          labelStyle: GoogleFonts.inder(),
                        
                        
                        ),
                        
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          
                          labelText: "Password",
                          labelStyle: GoogleFonts.inder(),
                        
                        
                        ),
                        
                      ),
                      SizedBox(height: 10,),
                        TextField(
                          controller: confirmpass,
                          obscureText: true,
                        decoration: InputDecoration(
                          
                          labelText: "Confirm Password",
                          labelStyle: GoogleFonts.inder(),
                        
                        
                        ),
                        
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          obj1.CreateAccount(emailAddress: email.text, password: password.text,context: context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.inder(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


            

          );
           }
}
      
    
  