import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Homee3.dart';
import 'package:flutter_application_1/modules/auth_screens/LoginPage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _PasswordState();
}

class _PasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child:TextField(
              decoration: InputDecoration(
                labelText: 'old password',
              ),
              obscureText: true,
            ) ,
            
                ),
                // SizedBox(width: 10),
                // Icon(Icons.verified,size: 16.0,color: Colors.white),
            

               
                
              ],
              
              
            ),
            
            SizedBox(height: 10),
            
            
            Row(
              children: [
                Expanded(
                  child:TextField(
                  decoration: InputDecoration(
                    labelText: 'new password',
                  ),
                  obscureText: true ,
                ),
                
                ),
                // SizedBox(width: 10),
             //Icon(Icons.verified,size: 16.0,color: Colors.white),

              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                 child:TextField(
                  decoration: InputDecoration(
                    labelText: 'confirm password',
                  ),
                  obscureText: true , 
                ),
                
                ),
               // SizedBox(width: 10),
            // Icon(Icons.verified,size: 16.0,color: Colors.white),

              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homee3()));

              },
              child: Text('change password'),
            ),
          ],
        ),
      ),
    );
  }
}