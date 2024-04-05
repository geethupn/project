import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
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
                 SizedBox(width: 10),
                 Icon(Icons.verified,size: 16.0,color: Colors.white),
            

               
                
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
                 SizedBox(width: 10),
             Icon(Icons.verified,size: 16.0,color: Colors.white),

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
                SizedBox(width: 10),
             Icon(Icons.verified,size: 16.0,color: Colors.white),

              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){

              },
              child: Text('change password'),
            ),
          ],
        ),
      ),
    );
  }
}