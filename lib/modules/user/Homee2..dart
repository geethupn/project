import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/Homee1.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
import 'package:google_fonts/google_fonts.dart';

class Homee2 extends StatefulWidget {
  final namecontroller = TextEditingController();
  final fromcontroller = TextEditingController();
  final tocontroller = TextEditingController();
  final timecontroller = TextEditingController();
  final vehiclenumbercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   Future addfirebase(Map<String,dynamic>registereinfomap,String userid)async{
           return FirebaseFirestore.instance
           .collection('journey')
          .doc(userid)
          .set(registereinfomap);
          
         }
         journey() async {
          String uid=FirebaseAuth.instance.currentUser!.uid;
           Map<String,dynamic>registereinfomap={
            "name":namecontroller.text,
            "from":fromcontroller.text,
            "to":tocontroller.text,
            "time":timecontroller.text,
            "vehiclenumber":vehiclenumbercontroller.text,
            "id":uid,
          };
          await addfirebase(registereinfomap, uid);
          const SnackBar(content: Text("details added to firebase succesfully"));
         }

  Homee2({super.key});

  @override
  State<Homee2> createState() => _userState();
}

class _userState extends State<Homee2> {
  bool carChecked = false;
  bool bikeChecked = false;
  bool trainChecked = false;
  bool settingsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Form(
                    key: widget._formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Checkbox(
                              value: carChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  carChecked = value!;
                                });
                              },
                            ),
                            Icon(Icons.directions_car, size: 20.0),
                            Checkbox(
                              value: bikeChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  bikeChecked = value!;
                                });
                              },
                            ),
                            Icon(Icons.directions_bike, size: 20.0),
                            Checkbox(
                              value: trainChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  trainChecked = value!;
                                });
                              },
                            ),
                            Icon(Icons.directions_train, size: 20.0),
                            Checkbox(
                              value: settingsChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  settingsChecked = value!;
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homee3(),
                                  ),
                                );
                              },
                              child: Icon(Icons.settings, size: 15.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: widget.namecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          
                          controller: widget.fromcontroller,
                         
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your from address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'From',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: widget.tocontroller,
                          
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your to address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'To',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: widget.timecontroller,
                         
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your time';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Time',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: widget.vehiclenumbercontroller,
                         
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your vehiclenumber';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Vehicle Number',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            if (widget._formKey.currentState!.validate()) {
                              // If the form is valid, proceed
                              // You can access form field values like this:
                              String name = widget.namecontroller.text;
                              String from = widget.fromcontroller.text;
                              String to = widget.tocontroller.text;
                              String time = widget.timecontroller.text;
                              String vehicleNumber =
                                  widget.vehiclenumbercontroller.text;
                              // Similarly, retrieve other form field values
                              // Navigate or perform further actions
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Ok',
                            style: GoogleFonts.inder(color: Colors.white),
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
    
