// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel
// {
//   String firstname;
//   String lastname;
//   String phone;
//   String? id;

//   UserModel({
//      required this.firstname,
//      required this.lastname,
//      required this.phone,
//      this.id
//   });

//   get contacts => null;

//   Map<String,dynamic> data(docId)=>
//   {
//     "first_name":firstname,"last_name":lastname,"phone":phone,"id":docId
//   };

//   factory UserModel.fromData(Map<String,dynamic> i)
//   {
//     return UserModel(
//       firstname: i["first_name"], 
//       lastname: i["last_name"], 
//       phone: i["phone"]);
//   }

//    factory UserModel.fromDocument(DocumentSnapshot doc)
//    {
//     return UserModel(
//       firstname: doc['first_name'],
//       lastname: doc['last_name'],
//       phone: doc['phone']
//     );
//    }

// }


import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstname;
  String lastname;
  String phone;
  String? id;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.phone,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      "first_name": firstname,
      "last_name": lastname,
      "phone": phone,
      "id": id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map["first_name"],
      lastname: map["last_name"],
      phone: map["phone"],
      id: map["id"],
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      firstname: data['first_name'],
      lastname: data['last_name'],
      phone: data['phone'],
      id: doc.id,
    );
  }
}