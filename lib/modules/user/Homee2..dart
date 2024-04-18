import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/Homee1.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
import 'package:google_fonts/google_fonts.dart';

class Homee2 extends StatefulWidget {
  const Homee2({super.key});

  @override
  State<Homee2> createState() => _userState();
}

class _userState extends State<Homee2> {
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
            
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Column(
                    children: [
                    
                      // Car, Bike, Train icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                            value: carChecked,
                            onChanged: (bool? value){
                              setState(() {
                                carChecked=value!;
                              });
                            },
                          ),
                          
                          
                          Icon(Icons.directions_car, size: 20.0),
                          Checkbox(
                            value: bikeChecked,
                            onChanged: (bool? value){
                              setState(() {
                                bikeChecked=value!;
                              });
                            },
                          ),
                          Icon(Icons.directions_bike, size: 20.0),
                          Checkbox(
                            value: trainChecked,
                            onChanged: (bool? value){
                              setState(() {
                                trainChecked=value!;
                              });
                            },
                          ),

                          Icon(Icons.directions_train, size: 20.0),
                          Checkbox(
                            value: settingsChecked,
                            onChanged: (bool? value){
                              setState(() {
                               settingsChecked=value!;
                              });
                            },
                          ),
                          TextButton(
                            onPressed: (){
                               Navigator.push(context,MaterialPageRoute(builder:(context) => Homee3()),);

                            },
                            child:Icon(Icons.settings,size: 15.0) ,
                          ),
                          
                          
                          
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
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);
                        },
                        
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
    
  
