
/*import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
import 'package:flutter_application_1/modules/user/profileedit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}
File? selectedImage;

class _EditProfileState extends State<EditProfile> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void>_pickedImageGallery()async{
      final pickedImage=await ImagePicker().pickImage(source:ImageSource.gallery);
      if(pickedImage==null)return;
      setState(() {
        selectedImage=File(pickedImage.path);
      });
    }
    String id = _auth.currentUser!.uid;

    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('user registration').doc(id).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          Map<String, dynamic>? userData = snapshot.data!.data() as Map<String, dynamic>?;
          _nameController.text = userData?['name'] ?? '';
          _emailController.text = userData?['email'] ?? '';
          _phoneController.text = userData?['phonenumber'] ?? '';
          //_ageController.text = userData?['age'] ?? '';

          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 20.0),
                
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                    image: selectedImage !=null
                    ? FileImage(selectedImage!)
                    : AssetImage("assets/ph.png")
                    as ImageProvider<Object>),
                  ),
                  
                  child:IconButton(
                    onPressed: ()async{
                      _pickedImageGallery().then((value) async
                      {
                        SettableMetadata metadata=
                        SettableMetadata(contentType: 'image/jpeg');
                        final currenttime=TimeOfDay.now();
                        UploadTask uploadTask=FirebaseStorage.instance
                        .ref()
                        .child('shoapimage/shop$currenttime')
                        .putFile(selectedImage!,metadata);
                        TaskSnapshot snapshot=await uploadTask;
                        await snapshot.ref.getDownloadURL().then((url) {
                          String id=randomString(10);
                          FirebaseFirestore.instance
                          .collection('user registration')
                          .doc(id)
                          .set({'image':url,id:id});
                        });
                      });
                     

                    },
                    icon:  Icon(Icons.camera_alt_sharp,color: Colors.black,size: 30,),
                  ),
                
                ),
                TextField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    //labelText: 'Name',
                    labelStyle: GoogleFonts.inder(color:Colors.white),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                   // labelText: 'Email',
                    labelStyle: GoogleFonts.inder(color:Colors.white),
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    //labelText: 'Phone Number',
                    labelStyle: GoogleFonts.inder(color:Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileEdit()));
                    // Perform edit action
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
                      onPressed: () async{
                        SharedPreferences preferences=await SharedPreferences.getInstance();
                        _auth.signOut().then((value) => 
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())));
                        preferences.clear();
                        log('logout succesfully' as num);
                        // Perform logout action
                      },
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
          );
        },
      ),
    );
  }
}*/


import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';
import 'package:flutter_application_1/modules/user/profileedit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

File? selectedImage;

class _EditProfileState extends State<EditProfile> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _pickedImageGallery() async {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }

    String id = _auth.currentUser!.uid;

    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('registration').doc(id).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }

          Map<String, dynamic>? userData = snapshot.data!.data() as Map<String, dynamic>?;
          _nameController.text = userData?['name'] ?? '';
          _emailController.text = userData?['email'] ?? '';
          _phoneController.text = userData?['phonenumber'] ?? '';

          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: selectedImage != null ? FileImage(selectedImage!) : AssetImage("assets/ph.png") as ImageProvider<Object>,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      _pickedImageGallery().then((value) async {
                        SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

                        final currenttime = TimeOfDay.now();

                        UploadTask uploadTask = FirebaseStorage.instance
                        .ref()
                        .child('shoapimage/shop$currenttime')
                        .putFile(selectedImage!, metadata);


                        TaskSnapshot snapshot = await uploadTask;
                        await snapshot.ref.getDownloadURL().then((url) {
                          String id = _auth.currentUser!.uid;
                          FirebaseFirestore.instance.collection('registration').doc(id).
                          update({'image':url});
                        });
                      });
                    },
                    icon: Icon(Icons.camera_alt_sharp, color: Colors.black, size: 30),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: GoogleFonts.inder(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.inder(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: GoogleFonts.inder(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showEditProfileBottomSheet(context);
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
                      onPressed: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        _auth.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())));
                        preferences.clear();
                        print('logout succesfully');
                        // Perform logout action
                      },
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
          );
        },
      ),
    );
  }

 
void _showEditProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () async {
                       Navigator.push(context,MaterialPageRoute(builder:(context) => EditProfile()),);
                      // Save changes
                      String id = _auth.currentUser!.uid;
                      await _firestore.collection('registration').doc(id).update({
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'phonenumber': _phoneController.text,
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
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
