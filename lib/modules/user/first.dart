import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
       // width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/new.png",
          ),
        ),
      ),
      ),
     )
     );
      
      
    
  }
}