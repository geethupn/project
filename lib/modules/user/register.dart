import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
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
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                        
                          SizedBox(height: 6),
                          Text(
                            'Username',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(),
                      SizedBox(height: 15),
                      Row(
                        children: [
                        
                          SizedBox(width: 10),
                          Text(
                            'Email',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                        
                          SizedBox(width: 10),
                          Text(
                            'Age',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                        
                          SizedBox(width: 10),
                          Text(
                            'Phone Number',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                        
                          SizedBox(width: 10),
                          Text(
                            'Password',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(obscureText: true),
                      SizedBox(height: 10),
                      Row(
                        children: [
                         
                          SizedBox(width: 10),
                          Text(
                            'Confirm Password',
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ],
                      ),
                      TextField(obscureText: true),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
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
          Positioned(
            top: 10,
            right: 20,
            child: Icon(Icons.menu, color: Colors.black),
          ),
         // SizedBox(height: 10),
        ],
      ),


            

          );
           }
}
      
    
  