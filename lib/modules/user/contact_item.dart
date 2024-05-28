import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_model.dart';

class ContactItemWidget extends StatelessWidget {
  final UserModel contact;

  const ContactItemWidget({required this.contact});

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
            child: Text(
              contact.firstname.substring(0, 1),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${contact.firstname} ${contact.lastname}',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            SizedBox(height: 4.0),
            Text(
              contact.phone,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}