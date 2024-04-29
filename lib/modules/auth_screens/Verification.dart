import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/Reset.dart';
import 'package:flutter_application_1/modules/user/ChangePassword.dart';
//import 'package:flutter_application_1/modules/user/Reset.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _ForgotState();
}

class _ForgotState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"), fit: BoxFit.cover)),
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Add your menu icon onPressed functionality here
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Security Code',
                  style: GoogleFonts.inder(fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Reset()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('verify', style: GoogleFonts.inder(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Verific extends StatefulWidget {
  const Verific({super.key});

  @override
  State<Verific> createState() => _ForgotState();
}

class _ForgotState extends State<Verific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"),fit: BoxFit.cover)),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('verify code',
            style: GoogleFonts.inder(
              fontSize:30,
              fontWeight:FontWeight.bold,
            ),),
            SizedBox(height: 20),
            Text('Enter Security Code',
            style: GoogleFonts.inder(
              fontSize:20,
             // fontWeight:FontWeight.bold,
            ),
            
            ),
            SizedBox(height: 20),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               //Text('Enter Security Code'),
               

                
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                 
                
              ],
            ),
            
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:Text('verify',style: GoogleFonts.inder(color:Colors.white),) ,
            ),
            
          ],
          
        ),
        
      ),
    );
  }
}*/