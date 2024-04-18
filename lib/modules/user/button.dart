import 'package:flutter/material.dart';
//import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/user/loginpage.dart';
import 'package:flutter_application_1/modules/user/register.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(const MyApp());
}
class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'logindemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('login/register '),
          actions: [
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.menu),
              color: Colors.white,
            ),
          ],
          
        ),
         body: Container(
      
        width: double.infinity,
         //height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/new.png",
            ),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),BlendMode.dstATop),
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
                 SizedBox(height: 20),
                 ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
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
      );
    
  }
}
