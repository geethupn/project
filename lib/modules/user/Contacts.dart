import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/phone.dart';
import 'package:flutter_application_1/user_model.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});

  String get initials => name.substring(0, 1); // Assuming single initials
}

class ContactItemWidget extends StatefulWidget {
  
  final Contact contact;

  const ContactItemWidget({required this.contact});

  @override
  State<ContactItemWidget> createState() => _ContactItemWidgetState();
}

class _ContactItemWidgetState extends State<ContactItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.blue, // Adjust color as needed
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(widget.contact.initials, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.contact.name, style: TextStyle(fontSize: 16.0,color: Colors.white)),
            SizedBox(height: 4.0),
            Text(widget.contact.phoneNumber, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<Contacts> {
  Controller controller=Controller();
  /*List<Contact> contacts = [
    Contact(name: 'sathi', phoneNumber: '8592825841'),
    Contact(name: 'Sachin', phoneNumber: '9446831967'),
    Contact(name: 'aneesh', phoneNumber: '9961166007'),
   // Contact(name: 'Asna', phoneNumber: '654'),
  ];*/
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    String id=FirebaseAuth.instance.currentUser!.uid;
    //List<Contact> filteredContacts = contacts.where((contact) =>
        //contact.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Contacts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
             Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);
            
            // Add functionality for menu button
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder:(context) => Phone()),);

              // Add functionality for add button
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: 'Search Contacts',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection('contacts').doc(id).snapshots(), builder: (context,snapshot){
          UserModel userModel=UserModel.fromData(snapshot.data!.data()!);
          return ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index)
            {
              return Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text(userModel.firstname),
                ),
              );
            },
          );
        }),
        /*child: Expanded(
          child: ListView.builder(
            itemCount: filteredContacts.length,
            itemBuilder: (context, index) {
              final contact = filteredContacts[index];
              return Column(
                children: [
                  ContactItemWidget(contact: contact),
                  Divider(color: Colors.white,
                  height: 1,
                  thickness: 1),

                ],

              );
             // return ContactItemWidget(contact: contact);
            },
          ),
        ),*/
      ),
    );
  }
}





/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/phone.dart';
import 'package:flutter_application_1/user_model.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});

  String get initials => name.substring(0, 1); // Assuming single initials
}

class ContactItemWidget extends StatefulWidget {
  
  final Contact contact;

  const ContactItemWidget({required this.contact});

  @override
  State<ContactItemWidget> createState() => _ContactItemWidgetState();
}

class _ContactItemWidgetState extends State<ContactItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.blue, // Adjust color as needed
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(widget.contact.initials, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.contact.name, style: TextStyle(fontSize: 16.0,color: Colors.white)),
            SizedBox(height: 4.0),
            Text(widget.contact.phoneNumber, style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<Contacts> {
  Controller controller=Controller();
  /*List<Contact> contacts = [
    Contact(name: 'sathi', phoneNumber: '8592825841'),
    Contact(name: 'Sachin', phoneNumber: '9446831967'),
    Contact(name: 'aneesh', phoneNumber: '9961166007'),
   // Contact(name: 'Asna', phoneNumber: '654'),
  ];*/
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    String id=FirebaseAuth.instance.currentUser!.uid;
    //List<Contact> filteredContacts = contacts.where((contact) =>
        //contact.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Contacts', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
             Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);
            
            // Add functionality for menu button
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder:(context) => Phone()),);

              // Add functionality for add button
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: 'Search Contacts',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection('contacts').doc(id).snapshots(), builder: (context,snapshot){
          UserModel userModel=UserModel.fromData(snapshot.data!.data()!);
          return ListView.builder(
            itemCount: 2,
            itemBuilder: (context,index)
            {
              return Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text(userModel.firstname),
                ),
              );
            },
          );
        }),
        /*child: Expanded(
          child: ListView.builder(
            itemCount: filteredContacts.length,
            itemBuilder: (context, index) {
              final contact = filteredContacts[index];
              return Column(
                children: [
                  ContactItemWidget(contact: contact),
                  Divider(color: Colors.white,
                  height: 1,
                  thickness: 1),

                ],

              );
             // return ContactItemWidget(contact: contact);
            },
          ),
        ),*/
      ),
    );
  }
}*/
