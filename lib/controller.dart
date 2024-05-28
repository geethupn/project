// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/user_model.dart';

// class Controller{
//   final db=FirebaseFirestore.instance;

//   Future addUser(UserModel userModel) async{
//     final docRef=db.collection("contacts").doc();
//     dynamic id=docRef.id;
//     docRef.set(userModel.data(id));
    
//   }

//   List<UserModel> listOfData=[];
//   Future<List<UserModel>> fetchAllUser() async
//   {
//     final snapshot=await db.collection("contacts").get();
//     listOfData = snapshot.docs.map((e)
//     {
//          return UserModel.fromData(e.data());
//     }).toList();
//     return listOfData;
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/user_model.dart';

class Controllerr {
  final db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel) async {
    final docRef = db.collection("contacts").doc();
    dynamic id = docRef.id;
    await docRef.set(userModel.toMap());
  }

  Stream<List<UserModel>> fetchAllUsers() {
    return db.collection("contacts").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromDocument(doc)).toList();
    });
  }
}