import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/modules/user/Forgot.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State< LoginPage> createState() => _NewState();
}

class _NewState extends State< LoginPage> {
  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  Controlprovider obj=Controlprovider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/ph.png"),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('login', style: GoogleFonts.inder()),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'email',
                      ),
                      style: GoogleFonts.inder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'password',
                      ),
                      style: GoogleFonts.inder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: ()async {
                 await   obj.VerifyAccount(emailAddress: email.text, password: password.text,context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle: GoogleFonts.inder(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextButton(
                          child: Text(
                            'forgot password',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            textStyle: GoogleFonts.inder(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Center(
                      child: Text(
                        '_____or login with____',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inder(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: Image.asset("assets/image8-2.webp"),
                      ),
                      SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: Image.asset("assets/facbook.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                // Add your onPressed functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}
