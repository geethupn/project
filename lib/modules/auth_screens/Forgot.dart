import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/Verification.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailcontroller=TextEditingController();
  String email=" ";
  final _formKey=GlobalKey<FormState>();

  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.push(context, 
      MaterialPageRoute(builder: (context)=>Forgot()),);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('password reset email has been sent'),));
    }
    on FirebaseAuthException catch (e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('no user found for that email'),));

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"),fit: BoxFit.cover,
        ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: GoogleFonts.inder(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your email address to reset your password',
                  style: GoogleFonts.inder(),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: 'Type your email',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(220, 199, 192, 192),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email=emailcontroller.text;
                        
                      });
                      resetPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: GoogleFonts.inder(color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

        
        
       // child: Column(
        /*  mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text('Forogot Password',
            style: GoogleFonts.inder(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20),
            Text('we will send a verification code to this email',
            style:GoogleFonts.inder() ,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
              
                labelText: 'type your email',
                labelStyle: GoogleFonts.inder(),
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                filled: true,
                fillColor: Color.fromARGB(220,199,192,192),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              
              child:Text('send',
              style: GoogleFonts.inder(color:Colors.white),
              ) ,
            ),
            
          ],*/
          
       // ),
        
    //  );
    //);
 // }
//}



/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/Verification.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"),fit: BoxFit.cover,
        ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
           
            Text('Forogot Password',
            style: GoogleFonts.inder(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20),
            Text('enter your email address to reset your password',
            style:GoogleFonts.inder() ,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
              
                labelText: 'type your email',
                labelStyle: GoogleFonts.inder(),
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                filled: true,
                fillColor: Color.fromARGB(220,199,192,192),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Verification()));

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              
              child:Text('send',
              style: GoogleFonts.inder(color:Colors.white),
              ) ,
            ),
            
          ],

            ),
            Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
        
        
       // child: Column(
        /*  mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text('Forogot Password',
            style: GoogleFonts.inder(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20),
            Text('we will send a verification code to this email',
            style:GoogleFonts.inder() ,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
              
                labelText: 'type your email',
                labelStyle: GoogleFonts.inder(),
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                filled: true,
                fillColor: Color.fromARGB(220,199,192,192),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              
              child:Text('send',
              style: GoogleFonts.inder(color:Colors.white),
              ) ,
            ),
            
          ],*/
          
        ),
        
      );
    //);
  }
}*/