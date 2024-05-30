import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CurrentLocationProvider with ChangeNotifier {
  var APIKEY = "AIzaSyBZHkeiz0Y1kI-xgC4rzrqObBNu_8DEA6I";

  // LatLng? from;
  // Future<LatLng?> getInitialLocation() async {
  //   bool serviceEnabled = await _location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await _location.requestService();
  //     if (!serviceEnabled) {
  //       return null;
  //     }
  //   }
  //   PermissionStatus permissionStatus = await _location.hasPermission();
  //   if (permissionStatus == PermissionStatus.denied) {
  //     permissionStatus = await _location.requestPermission();
  //     if (permissionStatus != PermissionStatus.granted) {
  //       return null;
  //     }
  //   }
  //   LocationData locationData = await _location.getLocation();
  //   from = LatLng(locationData.latitude!, locationData.longitude!);
  //   notifyListeners();
  //   log("initail location ");
  //   return from;
  // }

  //-----------------

  LatLng? currentLocationData;
  getCurrentLocation(Completer<GoogleMapController> controller) async {
    // setCustomeMarkerIcon();
    Location location = Location();

    log("ullilund");
    location.getLocation().then((location) {
      log("waiting");
      currentLocationData = LatLng(location.latitude!, location.longitude!);
      log("got");
                 Controller().updateCurrentLocation(currentLocationData!.latitude,currentLocationData!.longitude);

      notifyListeners();
    }).catchError((errrror) {
      log(errrror.toString());
    });
    GoogleMapController googleMapController = await controller.future;

    location.onLocationChanged.listen((newLoc) {
    
      currentLocationData = LatLng(newLoc.latitude!, newLoc.longitude!);

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(zoom: 13.4, target: currentLocationData!)));
      notifyListeners();
    });
  }

  
  // BitmapDescriptor fromIcon = BitmapDescriptor.defaultMarker;
  // BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  // BitmapDescriptor currentPositionIcon = BitmapDescriptor.defaultMarker;

  // void setCustomeMarkerIcon() {
  //   BitmapDescriptor.fromAssetImage(
  //           ImageConfiguration.empty, "assets/placeholder.png")
  //       .then((value) {
  //     fromIcon = value;
  //   });
  //   BitmapDescriptor.fromAssetImage(
  //           ImageConfiguration.empty, "assets/destination.png")
  //       .then((value) {
  //     destinationIcon = value;
  //   });
  //   //  BitmapDescriptor.fromAssetImage(
  //   //         ImageConfiguration.empty, "assets/profile.png")
  //   //     .then((value) {
  //   //   currentPositionIcon = value;
  //   // });
  // }
}
