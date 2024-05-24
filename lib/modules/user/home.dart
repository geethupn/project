import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Contacts.dart';
//import 'package:flutter_application_1/modules/user/Homee2..dart';
//import 'package:flutter_application_1/modules/user/home2.dart';
import 'package:flutter_application_1/modules/user/Location.dart';
import 'package:flutter_application_1/modules/user/Youtubedemo.dart';
import 'package:flutter_application_1/modules/user/emergency.dart';
import 'package:flutter_application_1/modules/user/journey.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_application_1/modules/user/yo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          DropdownButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            value: _selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue!;
                switch (_selectedOption) {
                  case 'journey details':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JourneyPage()),
                    );
                    break;
                  case 'location track':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location()),
                    );
                    break;
                  case 'self defence':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Youtubedemo()),
                    );
                    break;
                  case 'contacts':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contacts()),
                    );
                    break;
                  case 'emergency':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Emergency()),
                    );
                    break;
                  default:
                }
              });
            },
            items: <String>[
              'journey details',
              'location track',
              'self defence',
              'contacts',
              'emergency'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/image.png",
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'welcome to   \n  safeshield',
              style: GoogleFonts.jacquesFrancoisShadow(
                  fontSize: 35, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Contacts.dart';
import 'package:flutter_application_1/modules/user/Homee2..dart';
//import 'package:flutter_application_1/modules/user/home2.dart';
import 'package:flutter_application_1/modules/user/Location.dart';
import 'package:flutter_application_1/modules/user/Youtubedemo.dart';
import 'package:flutter_application_1/modules/user/emergency.dart';
import 'package:flutter_application_1/modules/user/journey.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_application_1/modules/user/yo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        //title: const Text("UserName",style:  TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          DropdownButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            value: _selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue!;
                switch (_selectedOption) {
                  case 'journey details':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JourneyPage()),
                    );
                    break;
                  case 'location track':
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Location()),
                  );
                    break;
                  case 'self defence':
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> Youtubedemo()),
                 // );
                    break;
                  case 'contacts':
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Contacts()),
                  );
                    break;  
                 case 'emergency':
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Emergency()),
                  );
                    // break;  
                 
                  default:
                }
              });
            },
            items: <String>['journey details', 'location track', 'self defence','contacts','emergency']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
     // backgroundColor: Colors.black,
      body: Container(
        
      
        width: double.infinity,
         height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image.png",
            ),
            
          
            ),
            
           
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('welcome to   \n  safeshield',style:GoogleFonts.jacquesFrancoisShadow(fontSize:35,color:Colors.white),),
          )),
          
          
         
      ),
      

    );
  }
}*/