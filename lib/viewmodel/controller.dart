import 'dart:collection';
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/journy_model.dart';
import 'package:flutter_application_1/model/reg_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Controller with ChangeNotifier {
  LatLng? to;
  LatLng? from;

  Future<LatLng?> _getCoordiantesFromAddress(String address) async {
    return await locationFromAddress(address).then((value) {
      Location location = value[0];
      final latlon = LatLng(location.latitude, location.longitude);
      notifyListeners();
      return latlon;
    }).catchError((error) {
      log(error.toString());
    });
  }

  Future<String?> _getAddressFromCoordinates(double lat, double lon) async {
    return placemarkFromCoordinates(lat, lon).then((value) {
      List<Placemark> placemark = value;

      log(placemark[0].toString());
      if (placemark[0].locality!.isNotEmpty || placemark[0].locality != null) {
        return placemark[0].locality;
      } else {
        return placemark[0].subLocality;
      }
    });
  }

  String? fromLocality;
  String? toLocality;

  getFromAndTo(fromlat, fromlon, toLat, toLon) async {
    _getAddressFromCoordinates(fromlat, fromlon)
        .then((value) => fromLocality = value);
    _getAddressFromCoordinates(toLat, toLon)
        .then((value) => toLocality = value);
  }

  String? currentLocation;
  getCurrentLocationAddress(lat, lon) async {
    _getAddressFromCoordinates(lat, lon)
        .then((value) => currentLocation = value);
  }

  Future get(String fromAddress, String toAddress) async {
  await  _getCoordiantesFromAddress(fromAddress).then((value) => from = value);

  await  _getCoordiantesFromAddress(toAddress).then((value) => to = value);
    notifyListeners();
  }

  Future storeCurrentJourneyInfo(JourneyModel journeyModel) async {
     log("hee2");
     log(journeyModel.uid.toString());
    final doc = FirebaseFirestore.instance
        .collection("Current Journey")
        .doc(FirebaseAuth.instance.currentUser!.uid);
         log("hee2");
     doc.set(journeyModel.toJson(doc.id));
    log("hee2");
  }

  Future updateCurrentLocation(lat, lon) async {
    FirebaseFirestore.instance
        .collection("Current Journey")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"currentLat": lat, "currentLon": lon});
  }

  List<JourneyModel> journeyList = [];
  Future getCurrentUserJournyNotification() async {
    final snapshot = FirebaseFirestore.instance
        .collection("Current Journey")
        .where("sharingUserId",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    // log(snapshot.first.toString()[10])
  return   snapshot.listen((event) {

      
      journeyList =
          event.docs.map((e) {
         
            // notifyListeners();
            return JourneyModel.fromJson(e.data());
          }).toList();

    });
    
    // return  snapshot;
  }

  RegistartinModel? selectedUserData;
  getSelecteduserData(uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("registration")
        .doc(uid)
        .get();
    if (snapshot.exists) {
      selectedUserData = RegistartinModel.fromJson(snapshot.data()!);
    }
  }

  // var APIKEY = "AIzaSyBZHkeiz0Y1kI-xgC4rzrqObBNu_8DEA6I";

  // List<LatLng> polyLineCOrdinated = [];
  // getPolyLine(PointLatLng origin, PointLatLng destination) async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   await polylinePoints
  //       .getRouteBetweenCoordinates(APIKEY, origin, destination)
  //       .then((result) {
  //     log("requesting");
  //     if (result.points.isNotEmpty) {
  //       for (var i in result.points) {
  //         log("requesting");
  //         polyLineCOrdinated.add(LatLng(i.latitude, i.latitude));
  //       }
  //       notifyListeners();
  //     }
  //   });
  // }
}
