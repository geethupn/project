import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegisterPage> {

  
  final usernamecontroller=TextEditingController();
   final emailcontroller=TextEditingController();
    final agecontroller=TextEditingController();
     final phonenumbercontroller=TextEditingController();
      final passwordcontroller=TextEditingController();
       final confirmpasswordcontroller=TextEditingController();
       final _formKey=GlobalKey<FormState>();
       final _auth=FirebaseAuth.instance;

       bool obscure = true;

       void toggile(){
        setState(() {
          obscure = !obscure;
        });
       }

       File? selectedImage;
      
        String email="",password="";
        Future addfirebase(Map<String,dynamic>registereinfomap,String userid)async{
           return FirebaseFirestore.instance
           .collection('registration')
          .doc(userid)
          .set(registereinfomap);
          
         }
     Future   registration()async {
  try {
 await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value)async{




     
          //String registered_user_id=randomString(10);
          String uid=value.user!.uid;
          Map<String,dynamic>registereinfomap={
            "name":usernamecontroller.text,
            "email":emailcontroller.text,
            "age":agecontroller.text,
            "phonenumber":phonenumbercontroller.text,
            "password":passwordcontroller.text,
            "image":'',
            "id":uid,
          };
        await   addfirebase(registereinfomap, uid);
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration successful')));

 

  });
   
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
     
  
  @override
  Widget build(BuildContext context) {

    Future<void> _pickedImageGallery() async {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }

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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
               
                //SizedBox(height: 20,),
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
                              inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
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
                              if(phonenumbercontroller.text.length<10 ||phonenumbercontroller.text.length>10)
                              {
                                return 'phone number must contain 10 digits';
                              }
                              return null;
                            },
                            
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: passwordcontroller,
                            
                           // controller: password,
                            obscureText: obscure,
                            
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: (){
                                toggile();
                              }, icon: Icon(obscure ?  Icons.visibility : Icons.visibility_off)),
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
                                registration().then((value) {
                                  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
                                });
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


                          SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('already accound?'),
                              TextButton(onPressed: (){
                                
                                 Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );

                              }, child: Text('Loggin'))
                            ],
                          )
                        ],
                      ),
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
  