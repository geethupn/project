import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  void _sendWhatsAppMessage() async {
    String phoneNumber = "+91 8590425329"; // Replace with police phone number
    String message = "Emergency: I need help!"; // Message to send
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: _sendWhatsAppMessage,
          child: Text('Emergency'),
        ),
      ),
    );
  }
}



/*import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(onPressed:()
        {

        },
        child: Text('emergemcy'),),
      ),
     
      
      
      
     

    );
  }
}*/