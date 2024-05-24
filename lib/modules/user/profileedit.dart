
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/EditProfile.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEdit extends StatefulWidget {
 const ProfileEdit({Key? key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>(); 
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _phonenumberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                  labelStyle: GoogleFonts.inder(color:Colors.white),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter your name';
                  }
                  return null; 
                },
               
              ),
              TextFormField(
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: GoogleFonts.inder(color:Colors.white),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter your email';
                  }
                  return null; 
                },
                
              ),
              TextFormField(
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phonenumberController,
                decoration: InputDecoration(
                  labelText: 'phonenumber',
                  labelStyle: GoogleFonts.inder(color:Colors.white),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter your phonenumber';
                  }
                  return null; // Return null when validation passes
                },
               
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                 
                  if (_formKey.currentState!.validate()) {
                   
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Edit',
                  style: GoogleFonts.inder(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.logout, color: Colors.white, size: 24),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16.0),
                    ),
                    child: Text(
                      'Log out',
                      style: GoogleFonts.inder(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
