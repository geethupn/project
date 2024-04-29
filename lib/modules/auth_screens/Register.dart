

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<Register> {

  
  final usernamecontroller=TextEditingController();
   final emailcontroller=TextEditingController();
    final agecontroller=TextEditingController();
     final phonenumbercontroller=TextEditingController();
      final passwordcontroller=TextEditingController();
       final confirmpasswordcontroller=TextEditingController();
       final _formKey=GlobalKey<FormState>();
      
        String email="",password="";
        Future addfirebase(Map<String,dynamic>registereinfomap,String userid)async{
           return FirebaseFirestore.instance
           .collection('user registration')
          .doc(userid)
          .set(registereinfomap);
          
         }
        registration()async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
   ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration successful')));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
          String registered_user_id=randomString(10);
          Map<String,dynamic>registereinfomap={
            "name":usernamecontroller.text,
            "email":emailcontroller.text,
            "age":agecontroller.text,
            "phonenumber":phonenumbercontroller.text,
            "password":passwordcontroller.text,
            "id":registered_user_id,
          };
          await addfirebase(registereinfomap, registered_user_id);
          const SnackBar(content: Text("details added to firebase succesfully"));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Weak password'),
        ));
  } else if (e.code == 'email-already-in-use') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('E-mail is already in use'),
        ));
  }
} catch (e) {
  print(e);
}
}
      /* registration() async {
  if (password != null) {
    if (isWeakPassword(password)) { // Check if the password is weak
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Weak password')),
      );
      return; // Exit registration process
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email already in use')),
        );
      } else {
        print('Error: ${e.code}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again later.')),
        );
      }
    }
  }
}

bool isWeakPassword(String password) {
  // Define your password strength criteria
  // For example, check if the length is less than 6 characters
  return password.length < 6;
}*/
         /*registration()async{
          if(password!=null){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign up Success"))
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(LoginPage())));
      }
      on FirebaseAuthException catch(e){
       if(e.code=='weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("weak password")));
       }
       else if(e.code=='email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("email already in use")));
       }

      }
    }
  }*/

          
  
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
                  
                  child: Form(key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        TextFormField(
                          
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: usernamecontroller,
                          
                          
                          
                          //controller: username,
                          decoration: InputDecoration(
                            
                          labelText: "Username",
                            labelStyle:GoogleFonts.inder(), 
                          
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your username';
                            }
                            return null;
                          },
                          
                        ),
                        SizedBox(height: 10,),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailcontroller,
                          
                           // controller: email,
                          decoration: InputDecoration(
                            
                            labelText: "Email",
                            labelStyle: GoogleFonts.inder(),
                          
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your email';
                            }
                            RegExp emailRegExp=RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                          );
                          if(!emailRegExp.hasMatch(value)){
                            return 'Please Enter a Valid Email';
                          }
                            return null;
                          },

                          
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: agecontroller,
                          
                          //controller: age,
                          decoration: InputDecoration(
                            
                            labelText: "Age",
                            labelStyle: GoogleFonts.inder(),
                          
                          
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your age';
                            }
                            return null;
                          },
                          
                        ),
                        SizedBox(height: 10,),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: phonenumbercontroller,
                          
                           // controller: phonenumber,
                          decoration: InputDecoration(
                            
                            labelText: "Phone Number",
                            labelStyle: GoogleFonts.inder(),
                          
                          
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your phonenumber';
                            }
                            return null;
                          },
                          
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordcontroller,
                          
                         // controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            
                            labelText: "Password",
                            labelStyle: GoogleFonts.inder(),
                          
                          
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            return null;
                          },
                          
                        ),
                        SizedBox(height: 10,),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: confirmpasswordcontroller,
                          
                            //controller: confirmpass,
                            obscureText: true,
                          decoration: InputDecoration(
                            
                            labelText: "Confirm Password",
                            labelStyle: GoogleFonts.inder(),
                          
                          
                          ),

                          validator: (value){
                            if(value!.isEmpty){
                              return 'please verify your password';
                            }
                            if((passwordcontroller.text!=confirmpasswordcontroller.text)){
                              return 'password do not match';
                            }
                            return null;
                          },
                          
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async{
                           // if(_formKey.currentState!validate()){
                             
                            
                            if(_formKey.currentState!.validate()){
                             setState(() {
                                email=emailcontroller.text;
                                password=passwordcontroller.text;
                              });
                              registration();
                            }
                           // obj1.CreateAccount(emailAddress: email.text, password: password.text,context: context);
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
          ),
        ],
      ),


            

          );
           }

      
}
  