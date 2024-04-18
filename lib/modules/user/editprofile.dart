import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("edit profile",style: TextStyle(color: Colors.white,fontSize: 24.0,
          ),),
          SizedBox(height: 20.0),
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
          ),
          //Column(
            //children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              SizedBox(height: 20),
              //Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                //children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homee3()));
                  
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      padding: EdgeInsets.all(16.0)
                    ),
                    child: Text('Edit',style:GoogleFonts.inder(color:Colors.black),),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout,color: Colors.white,size: 24),
                      SizedBox(width: 10),
                      
                      ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          padding:EdgeInsets.all(16.0),
                        ),
                        child: Text('log out',style:GoogleFonts.inder(color:Colors.black),),
                      ),
                    ],
                  ),
                  // Padding(
                    // padding: const EdgeInsets.only(right: 300),
                     //child: ElevatedButton(
                      //onPressed: (){
                     
                     // },
                     // child: Text('Log Out'),
                                        // ),
                  // );
                ],
              ),
          //],
        );
     // ),
   // );
  }
}