import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/map.png"),
                ),
              ),
            ),
          ),
         
        Center(
          child: ElevatedButton(
            onPressed: (){
          
            },
            
            
            child: Text('Track',
             style: GoogleFonts.inder(color: Colors.black),),
          ),
        ),
          Positioned(
            top: 30, // Adjust this value to position the arrow vertically
            left: 10, // Adjust this value to position the arrow horizontally
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);

               
              },
            ),
          ),
        ],
      ),
    );
  }
}