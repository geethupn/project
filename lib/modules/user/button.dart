import 'package:flutter/material.dart';
//import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
//import 'package:flutter_application_1/modules/auth_screens/Register.dart';
import 'package:flutter_application_1/modules/auth_screens/registerpage.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
//import 'package:flutter_application_1/modules/user/registerr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main()
// {
//   runApp(const MyApp());
// }
class Button extends StatelessWidget {
  const Button({super.key});
  /*check(BuildContext context)async{
   SharedPreferences preferences=await SharedPreferences.getInstance();
   String? name=preferences.getString('isloggin');
   if(name!=null)
   {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
   }
   else
   {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
   }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'logindemo',
      home: Scaffold(
        
         body: Padding(
           padding: const EdgeInsets.only(left: 20,right: 20),
           child: Container(
                 
                   width: double.infinity,
           height: MediaQuery.of(context).size.height,
                   decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/new.png",
              ),
             // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),BlendMode.dstATop),
              ),
              //fit: BoxFit.fill,
            ),
                   
                   child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context) => LoginPage()),);
           
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                   child:Text('login',style: GoogleFonts.inder(color:Colors.white),) ,),
                   const SizedBox(height: 20),
                   ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  
                  child: Text('register',style: GoogleFonts.inder(color:Colors.white),),
                  ),
           
            ],
                   ),
                 
               
                
                
              
            ),
         ),
        ),
      );
    
  }
}
