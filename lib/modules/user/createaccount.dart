import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ph.png"),fit: BoxFit.cover,
            ),
            ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                   
                    print('Sign up button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      // Implement navigation to the login screen here
                      // This button is currently a placeholder
                      print('Navigate to login screen');
                    },
                    child: Text('Log In',style: TextStyle(color: Colors.black),),
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