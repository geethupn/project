import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/user_model.dart';
//import 'package:flutter_application_1/modules/user/Contacts.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Controllerr controller=Controllerr();



 
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _firstNameController,
                            
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phoneNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more validation rules for phone number if needed
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.add, color: Colors.white),
                  labelStyle: GoogleFonts.inder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);
                  if (_formKey.currentState!.validate()) {
                    
                    
                   
                  }
                  controller.addUser(UserModel(firstname: _firstNameController.text, 
                  lastname: _lastNameController.text, 
                  phone: _phoneNumberController.text));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.inder(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
