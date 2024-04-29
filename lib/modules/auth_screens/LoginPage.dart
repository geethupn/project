import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/modules/auth_screens/Forgot.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
//import 'package:flutter_application_1/modules/user/Forgot.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State< LoginPage> createState() => _NewState();
}

class _NewState extends State< LoginPage> {
  final _formKey=GlobalKey<FormState>();
  final _emailcontroller=TextEditingController();
   final _passwordcontroller=TextEditingController();
   String email="",password="";
   login()async
{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
 );
 ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in succesfull')));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The user is not found'),
          ));
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password'),
          ));
  }
}
}
   /*login()async{
    
   if(password!=null){
            try{
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('login succes'),),);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(),),);
            }
            on FirebaseAuthException catch (e){
              if(e.code=='user-not-found'){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('no user found register'),),);
              }
              else if(e.code=='wrong-password'){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('wrong password  provided by the user'),),);
              }
              }
           
                }
   
   }*/


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        
        child: Stack(
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
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailcontroller,
                      // controller: email,
                        decoration: InputDecoration(
                          hintText: 'email',
                        ),
                        style: GoogleFonts.inder(),
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
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                         controller: _passwordcontroller,

                       // controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password',
                        ),
                        style: GoogleFonts.inder(),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'please enter password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            email=_emailcontroller.text;
                            password=_passwordcontroller.text;
                          });
                          login();
                          
                        }
                      
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:Text('invalid email,password'),
                              ),
                          );

                        }
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
                              'Forgot Password?',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot()));
                            },
                           /* style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              textStyle: GoogleFonts.inder(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),*/
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
          
          ],
        ),
      ),
    );
  }
}
