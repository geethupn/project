import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/location_service/locationtrack.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  String? currentAddress;
  Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lat: ${_currentPosition?.latitude ?? ''}'),
          Text('Lang: ${_currentPosition?.longitude ?? ''}'),
          Text('Address: ${currentAddress ?? ''}'),
          ElevatedButton(
            onPressed: () async {
              Position? position = await LocationHandler.getCurrentPosition();
              if (position != null) {
                setState(() {
                  _currentPosition = position;
                });
                String? address = await LocationHandler.getAddressFromLatLng(position);
                setState(() {
                  currentAddress = address;
                });
              } else {
                // Handle case where position is null (e.g., permission denied)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Location permissions are denied")),
                );
              }
            },
            child: const Text("Get Current Location"),
          ),


         TextButton(onPressed: (){
            Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LocationMap(),
        ),
      );
         }, child: Text('google map'))
        ],
      ),
    );
  }
}

abstract class LocationHandler {
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled. Please enable the services
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permissions are denied
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, we cannot request permissions.
      return false;
    }
    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await handleLocationPermission();
      if (!hasPermission) return null;
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMarks[0];
      return "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}";
    } catch (e) {
      return null;
    }
  }
}
