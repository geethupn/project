import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/AppLanguage.dart';
import 'package:flutter_application_1/modules/user/ChangePassword.dart';
import 'package:flutter_application_1/modules/user/EditProfile.dart';
import 'package:flutter_application_1/modules/user/Homee2..dart';
import 'package:google_fonts/google_fonts.dart';

class Homee3 extends StatefulWidget {
  const Homee3({super.key});

  @override
  State<Homee3> createState() => _Home3State();
}

class _Home3State extends State<Homee3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings',style: GoogleFonts.inder(),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.black,),
          onPressed: (){
             Navigator.push(context,MaterialPageRoute(builder:(context) => Homee2()),);

          },
        ),
        
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
       
        color: Colors.black, 
        child: Column(
          children: [
            
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 450,
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));

                        },
                         child: ListTile(
                      
                       title: Text(' Profile',style: GoogleFonts.inder(),),
                       trailing: Icon(Icons.chevron_right),
                      ),

                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(20),
                       child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));

                        },
                        child: ListTile(
                          title: Text('Change Password',style: GoogleFonts.inder(),),
                          trailing: Icon(Icons.chevron_right),
                        ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(20),
                       child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AppLanguage()));

                        },
                        child: ListTile(
                          title: Text('App Language'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                       ),
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
                