import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset extends StatelessWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/ph.png",
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset Your Password',
                  style: GoogleFonts.inder(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'new password',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'confirm password',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) => LoginPage()),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('reset', style: GoogleFonts.inder(color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset extends StatelessWidget {
  const Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      
        width: double.infinity,
         //height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/ph.png",
            ),
            //fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reset Your Password',
            style: GoogleFonts.inder(
              fontSize:30,
              fontWeight:FontWeight.bold,
            ),),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'new password',
                  labelStyle: GoogleFonts.inder(),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                ),
                obscureText: true,
              ),
            ),
             SizedBox(
              width: 300,
              height: 50,
              
             
               child: TextField(

                decoration: InputDecoration(
                  labelText: 'confirm password',
                  labelStyle: GoogleFonts.inder(),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                           ),
             ),
             SizedBox(height: 10),
             ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('reset',style:GoogleFonts.inder(color:Colors.white),),
            ),

            
          ],

    ),
    ),
    );
  }
}*/