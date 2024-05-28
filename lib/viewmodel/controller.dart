import 'dart:developer';

import 'package:flutter/material.dart';
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

  Future get(String fromAddress, String toAddress) async {
    _getCoordiantesFromAddress(fromAddress).then((value) => from = value);

    _getCoordiantesFromAddress(toAddress).then((value) => to = value);
    notifyListeners();
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
