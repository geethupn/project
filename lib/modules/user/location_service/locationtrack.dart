import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:flutter_application_1/viewmodel/current_location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class PageGoogleMap extends StatefulWidget {
  PageGoogleMap({super.key});

  @override
  State<PageGoogleMap> createState() => _PageGoogleMapState();
}

class _PageGoogleMapState extends State<PageGoogleMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    Provider.of<CurrentLocationProvider>(context, listen: false)
        .getCurrentLocation(_controller);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 71, 202, 75),
            child: Center(
                child: IconButton(
                    onPressed: () async {
                      Location location = Location();

                      location.getLocation().then((location)async {
                        final currentLocationData =
                            LatLng(location.latitude!, location.longitude!);
                   await     Controller().updateCurrentLocation(
                            currentLocationData.latitude,
                            currentLocationData.longitude);
                     await   FirebaseFirestore.instance
                            .collection("Current Journey")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({"isJouneryEnd": true});
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home(),), (route) => false);
                      }).catchError((errrror) {});
                    },
                    icon: Icon(
                      Icons.stop,
                      size: 40,
                    ),
                    color: Colors.white)),
            onPressed: () {}),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [],
                ),
              ),
              Consumer<CurrentLocationProvider>(
                  builder: (context, currentProvider, child) {
                return Expanded(
                    child: currentProvider.currentLocationData == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Consumer<Controller>(
                            builder: (context, googleController, child) {
                            return GoogleMap(
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              initialCameraPosition: CameraPosition(
                                  zoom: 13,
                                  target: currentProvider.currentLocationData!),
                              markers: {
                                Marker(
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        10),
                                    markerId: const MarkerId("currentlocation"),
                                    position:
                                        currentProvider.currentLocationData!),
                                Marker(
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        50),
                                    markerId: const MarkerId("initial"),
                                    position: googleController.from ??
                                        currentProvider.currentLocationData!),
                                Marker(
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        80),
                                    markerId: const MarkerId("destination"),
                                    position: googleController.to ??
                                        currentProvider.currentLocationData!)
                              },
                              // polylines: {
                              //   Polyline(
                              //       polylineId: PolylineId("route"),
                              //       points: googleController.polyLineCOrdinated)
                              // },
                            );
                          }));
              }),
            ],
          ),
        ));
  }
  //------------------
}
