import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  bool carChecked=false;
  bool bikeChecked=false;
  bool trainChecked=false;
  bool settingsChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //return Scaffold(
      backgroundColor: Colors.black, // Assuming a black background
      body: SafeArea(
        child: Column(
          children: [
            // Header (replace with your app name/logo)
            /*Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Your App Name',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),*/
            // Body section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                    
                      // Car, Bike, Train icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: carChecked,
                            onChanged: (bool? value){
                              setState(() {
                                carChecked=value!;
                              });
                            },
                          ),
                          
                          
                          Icon(Icons.directions_car, size: 30.0),
                          Checkbox(
                            value: bikeChecked,
                            onChanged: (bool? value){
                              setState(() {
                                bikeChecked=value!;
                              });
                            },
                          ),
                          Icon(Icons.directions_bike, size: 30.0),
                          Checkbox(
                            value: trainChecked,
                            onChanged: (bool? value){
                              setState(() {
                                trainChecked=value!;
                              });
                            },
                          ),

                          Icon(Icons.directions_train, size: 30.0),
                          Checkbox(
                            value: settingsChecked,
                            onChanged: (bool? value){
                              setState(() {
                               settingsChecked=value!;
                              });
                            },
                          ),
                          Icon(Icons.settings,size: 30.0),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      // Form fields
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'From',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'To',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Time',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Vehicle Number',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      // Ok button
                      ElevatedButton(
                        onPressed: () {},
                        
                        child: Text('Ok',style: GoogleFonts.inder(color:Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    
  
