import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  
     final Completer<GoogleMapController> _completer  =Completer();

    final googel_api_key = 'AIzaSyBZHkeiz0Y1kI-xgC4rzrqObBNu_8DEA6I';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(10.98, 76.23),
            zoom: 14.5,
            
            
          ),
        ),
      ),
    );
  }
}
