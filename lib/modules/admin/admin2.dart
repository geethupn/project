
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/admin/Admin3.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       appBar: AppBar(
           title: Text('safeshield'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: (){
             

            },

        ),
        ],
      ),
      
  
     
      body:  Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/admin.png', // Replace 'your_image.png' with your image asset path
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 35),
                      TextButton(
                        onPressed: (){

                        },
                        child:Text(
                        'Home',
                        style: GoogleFonts.inder(color: Colors.white),
                      ) ,
                      )
                      ,
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person,color: Colors.white,
                      ),
                      SizedBox(width: 20.0),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder:(context) => Admin3()),);

                        },
                        child:Text(
                        'User',
                        style: GoogleFonts.inder(color: Colors.white),
                      ) ,
                      ),
                     
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout_sharp,color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      TextButton(
                        onPressed: (){

                        },
                        child: Text(
                        'Logout',
                        style: GoogleFonts.inder(color: Colors.white),
                      ),

                      ),
                      
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
     );
    
  }
}
