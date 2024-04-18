import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Homee1 extends StatefulWidget {
  const Homee1({super.key});

  @override
  State<Homee1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homee1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.menu,
              color: Colors.black,),
              onPressed: () {
                
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
          
            child: Container(
              color: Colors.white,
              width: 500,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                    child: Text('Jouney Details',style: GoogleFonts.inder(color:Colors.white),),
                    
                  
                  ),
                  SizedBox(height: 20),
                   ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                    child: Text('Location Track',style: GoogleFonts.inder(color:Colors.white),),
                  ),
                  SizedBox(height: 20),
                   ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                    child: Text('Self Defence',style: GoogleFonts.inder(color:Colors.white),),
                  ),
                  SizedBox(height: 20),
                   ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                    child: Text('Contacts',style: GoogleFonts.inder(color:Colors.white),),
                  ),
                  SizedBox(height: 20),
                   ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
               
              
                
                    child: Text('Emergency',style: GoogleFonts.inder(color:Colors.white),),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

          
        ),
      ),
    );
  }
}