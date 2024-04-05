import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black,
      body: Container(
      
        width: double.infinity,
         height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image.png",
            ),
           // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),BlendMode.dstATop),
            ),
            //fit: BoxFit.fill,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.menu,
                  color: Colors.white),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
      ),

    );
  }
}