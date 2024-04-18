import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Contacts.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("contact",style: TextStyle(color: Colors.white,fontSize: 24.0,
          ),),
          SizedBox(height: 20.0),
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
          ),
           SizedBox(width: 10),
          
             
              TextField(
                
                decoration: InputDecoration(
                  
                  
                  labelText: 'First Name',
                  
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
               SizedBox(width: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.add,color: Colors.white),
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              SizedBox(height: 20),
              //Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                //children: [
                  ElevatedButton(
                    onPressed: (){
                       Navigator.push(context,MaterialPageRoute(builder:(context) => Contacts()),);
                  
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      padding: EdgeInsets.all(16.0)
                    ),
                    child: Text('Save',style:GoogleFonts.inder(color:Colors.black),),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     // Icon(Icons.logout,color: Colors.white,size: 24),
                      SizedBox(width: 10),
                      
                    /*  ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          padding:EdgeInsets.all(16.0),
                        ),
                        child: Text('save',style:GoogleFonts.inder(color:Colors.black),),
                      ),*/
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
  }
}