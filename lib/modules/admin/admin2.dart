/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('safeshield'),
        actions: [
          IconButton(icon: Icon(Icons.menu),color: Colors.black,
          onPressed: (){

          },
          ),
          
        ],
      ),
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/admin.png', // Replace 'your_image.png' with your image asset path
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.inder(color: Colors.white),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15), // Added for spacing
                  Text(
                    'Password',
                    style: GoogleFonts.inder(color: Colors.white),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: GoogleFonts.inder(color: Colors.black), // Change text color to black
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin extends StatelessWidget {
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
      
    
   /*  body: Column(
      children: [
        Divider(
          color: Colors.black,
          height: 1,
          thickness: 1,
        ),*/
    //  ],
  //   )
     
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
