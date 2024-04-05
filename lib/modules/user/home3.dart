import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _Home3State();
}

class _Home3State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.height,
       // width: double.infinity,
        //height: double.infinity,
        color: Colors.black, 
        child: Column(
          children: [
            
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 450,
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                     padding: const EdgeInsets.all(20),
                      child: ListTile(
                      
                        title: Text('Edit Profile'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(20),
                       child: ListTile(
                       
                        title: Text('Change Password'),
                        trailing: Icon(Icons.chevron_right),
                                           ),
                     ),
                     Padding(
                      padding: const EdgeInsets.all(20),
                       child: ListTile(
                       
                        title: Text('App Language'),
                        trailing: Icon(Icons.chevron_right),
                                           ),
                     ),
                  ],
                ),
                
                
                
              ),
            ),
            
          ],
        ),
      ),

    );
  }
}