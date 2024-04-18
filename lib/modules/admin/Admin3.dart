
import 'package:flutter/material.dart';

class Admin3 extends StatelessWidget {
  const Admin3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('safeshield'),
        
        actions: [IconButton(
          icon: Icon(Icons.menu),
          
          onPressed: (){

          },
        )],
      ),
      body: Column(
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
    );
  }
}
