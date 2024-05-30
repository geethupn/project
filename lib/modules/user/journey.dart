import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/model/journy_model.dart';
//import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
import 'package:flutter_application_1/modules/user/location_service/locationtrack.dart';
//import 'package:flutter_application_1/modules/user/location_service/locationtrack.dart';
import 'package:flutter_application_1/modules/user/location_service/permission.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JourneyPage extends StatefulWidget {
  JourneyPage({Key? key}) : super(key: key);

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  bool carChecked = false;
  bool bikeChecked = false;
  bool trainChecked = false;
  bool settingsChecked = false;

  final nameController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final timeController = TextEditingController();
  final vehicleNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        timeController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> journeyDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> journeyInfo = {
      "name": nameController.text,
      "from": fromController.text,
      "to": toController.text,
      "time": timeController.text,
      "vehicleNumber": vehicleNumberController.text,
      "id": uid,
    };
    await FirebaseFirestore.instance
        .collection('journey')
        .doc(uid)
        .set(journeyInfo);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Details added to Firestore successfully")),
    );
  }

  String? validateVehicleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your vehicle number';
    }
    // Basic regex for vehicle number validation (customize as needed)
    String pattern = r'^[A-Z]{2}-\d{2}-[A-Z]{1,2}-\d{4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid vehicle number (e.g., AB-12-CD-3456)';
    }
    return null;
  }

  String? sharingUid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                          const Icon(Icons.directions_car, size: 20.0),
                          Checkbox(
                            value: bikeChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                bikeChecked = value!;
                              });
                            },
                          ),
                          const Icon(Icons.directions_bike, size: 20.0),
                          Checkbox(
                            value: trainChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                trainChecked = value!;
                              });
                            },
                          ),
                          const Icon(Icons.directions_train, size: 20.0),
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
                                  builder: (context) => const Homee3(),
                                ),
                              );
                            },
                            child: const Icon(Icons.settings, size: 15.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      FutureBuilder(
                          future: Controllerr().getAllUserforDropDown(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: SizedBox(),
                              );
                            }
                            final list = snapshot.data;
                            return  DropdownButtonFormField(
                                decoration:  InputDecoration(
                                  labelText:list!.isEmpty?"Sorry No User to Connect": 'Select who want to share?',
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select the user ';
                                  }
                                  return null;
                                },
                                items: list
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e!.name),
                                        ))
                                    .toList(),
                                onChanged: (selected) {
                                  sharingUid = selected!.uid;
                                  log(sharingUid!);
                                });
                          }),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: fromController,
                        decoration: const InputDecoration(
                          labelText: 'From',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your starting point';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: toController,
                        decoration: const InputDecoration(
                          labelText: 'To',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your destination';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        readOnly: true,
                        controller: timeController,
                        decoration: InputDecoration(
                          labelText: 'Time',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.access_time),
                            onPressed: () => _selectTime(context),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: vehicleNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Number',
                        ),
                        validator: validateVehicleNumber,
                      ),
                      const SizedBox(height: 20.0),
                      Consumer<Controller>(
                          builder: (context, buttonController, child) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              buttonController
                                  .get(fromController.text.trim(),
                                      toController.text.trim())
                                  .then((value) {
//                               
                                buttonController.storeCurrentJourneyInfo(
                                    JourneyModel(
                                      isJouneryEnd: false,
                                        sharingUserId: sharingUid.toString(),
                                        currentLat: 0.0,
                                        currentLon: 0.0,
                                        fromLat: buttonController.from!.latitude.toDouble(),
                                        fromLon: buttonController.from!.longitude.toDouble(),
                                        toLat: buttonController.to!.latitude.toDouble(),
                                        toLon: buttonController.to!.longitude.toDouble())).then((value) {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PageGoogleMap()));

                                        });
                                
                              });
                              // journeyDetails();
                            }

                            // MaterialPageRoute(
                            //     builder: (context) =>  LocationMap(
                            //       sourceLocation: fromController.text.trim(),
                            //       destionationLocation: toController.text.trim(),
                            //     ),
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
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
//import 'package:flutter_application_1/modules/user/location_service/locationtrack.dart';
import 'package:flutter_application_1/modules/user/location_service/permission.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyPage extends StatefulWidget {
  JourneyPage({Key? key}) : super(key: key);

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  bool carChecked = false;
  bool bikeChecked = false;
  bool trainChecked = false;
  bool settingsChecked = false;

  final nameController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final timeController = TextEditingController();
  final vehicleNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        timeController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> journeyDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> journeyInfo = {
      "name": nameController.text,
      "from": fromController.text,
      "to": toController.text,
      "time": timeController.text,
      "vehicleNumber": vehicleNumberController.text,
      "id": uid,
    };
    await FirebaseFirestore.instance
        .collection('journey')
        .doc(uid)
        .set(journeyInfo);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Details added to Firestore successfully")),
    );
  }

  String? validateVehicleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your vehicle number';
    }
    // Basic regex for vehicle number validation (customize as needed)
    String pattern = r'^[A-Z]{2}-\d{2}-[A-Z]{1,2}-\d{4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid vehicle number (e.g., AB-12-CD-3456)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: fromController,
                        decoration: InputDecoration(
                          labelText: 'From',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your starting point';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: toController,
                        decoration: InputDecoration(
                          labelText: 'To',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your destination';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        readOnly: true,
                        controller: timeController,
                        decoration: InputDecoration(
                          labelText: 'Time',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () => _selectTime(context),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: vehicleNumberController,
                        decoration: InputDecoration(
                          labelText: 'Vehicle Number',
                        ),
                        validator: validateVehicleNumber,
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            journeyDetails();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Permission(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/



