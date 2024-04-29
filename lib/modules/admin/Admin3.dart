
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/admin/Admin2.dart';

class Admin3 extends StatelessWidget {
  const Admin3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
      body: Column(
        
      
        children: [
          AppBar(
            title: Text('SafeShield'),
            actions: [
               IconButton(
          icon: Icon(Icons.menu),
          
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder:(context) => Admin2()),);

          },
        ),],

            
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('users'),
          SizedBox(height: 10),
          Row(
          
            children: [
               Icon(Icons.person),
                SizedBox(width: 30),
               Text('ammu'),
               SizedBox(width: 30),
              TextButton(
                onPressed: (){

                },
                
                child: Text('remove'),
              ),
            ],
           

          ),
           Row(
          
            children: [
               Icon(Icons.person),
                SizedBox(width: 30),
               Text('arati'),
                SizedBox(width: 30),
              TextButton(
                onPressed: (){

                },
                child: Text('remove'),
              ),
              

          
         
        ],
        
      ),
       Row(
           
            children: [
               Icon(Icons.person),
               SizedBox(width: 30),
               Text('anju'),
                SizedBox(width: 30),
              TextButton(
                onPressed: (){

                },
                child: Text('remove'),
              ),
               
            ],
       ),

      
    
        ],
          ),

            ],

          ),
          
          
          
    );
    
  }
}
