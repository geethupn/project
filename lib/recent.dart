/*import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: Colors.black,
        
      ),
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0,top: 20.0),
                child: Icon(Icons.arrow_back,color: Colors.white,
                size: 30.0),

              ),
              Expanded(
                child: Center(
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white,
                      size: 100.0),
                      SizedBox(height: 10.0),
                      Text('jhon',style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 20.0),
                      Container(
                        height: 2.0,
                        width: MediaQuery.of(context).size.width*0.7,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12345',style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Icon(Icons.call,size: 30.0,color: Colors.white,),
                              SizedBox(width: 10.0),
                              Icon(Icons.message,size: 30.0,color: Colors.white,),
                            ],
                          ),
                        /*  Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                 child: Text('additional' ,style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          
                              ),
                              Positioned(
                                right: 60.0,
                                top: 0.0,
                                child: Icon(
                                  Icons.call,
                                  size: 30.0,
                                ),
                          
                              ),
                              Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: Icon(Icons.message,
                                size: 30),
                              ),
                            ],
                           
                          ),*/
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('message',style: TextStyle(
                            fontSize: 16.0,color: Colors.white
                          ),),
                          SizedBox(width: 10.0),
                          Row(
                            children: [
                              Text('+91123',style: TextStyle(
                                fontSize: 16.0,color: Colors.white
                              ),),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('voice call',style: TextStyle(
                            fontSize: 16.0,color: Colors.white
                          ),),
                          SizedBox(width: 10.0),
                          Row(
                            children: [
                              Text('+91123',style: TextStyle(
                                fontSize: 16.0,color: Colors.white
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
             
            
            ],
          ),
        ),
      ),
    );
  }
}