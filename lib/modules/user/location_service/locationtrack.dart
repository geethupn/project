import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:flutter_application_1/viewmodel/current_location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PageGoogleMap extends StatefulWidget {
  PageGoogleMap({super.key});

  @override
  State<PageGoogleMap> createState() => _PageGoogleMapState();
}

class _PageGoogleMapState extends State<PageGoogleMap> {
  var toController = TextEditingController();
  var fromController = TextEditingController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    Provider.of<CurrentLocationProvider>(context, listen: false)
        .getCurrentLocation(_controller);
    // Provider.of<CurrentLocationProvider>(context, listen: false)

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                // TextField(
                //   controller: fromController,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(), hintText: "From:"),
                // ),
                // TextField(
                //   controller: toController,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(), hintText: "To:"),
                // ),
                // Consumer<Controller>(
                //     builder: (context, buttonController, child) {
                //   return TextButton(
                //       onPressed: () {
                //         buttonController.get(fromController.text.trim(),
                //                 toController.text.trim())
                //             //   .then((value) {
                //             // buttonController.getPolyLine(
                //             //     PointLatLng(buttonController.from!.latitude,
                //             //         buttonController.from!.longitude),
                //             //     PointLatLng(buttonController.to!.latitude,
                //             //         buttonController.to!.longitude))
                //             //           ;
                //             // })
                //             ;
                //       },
                //       child: const Text("Locate Me"));
                // })
              ],
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
                                icon: BitmapDescriptor.defaultMarkerWithHue(10),
                                markerId: const MarkerId("currentlocation"),
                                position: currentProvider.currentLocationData!),
                            Marker(
                                icon: BitmapDescriptor.defaultMarkerWithHue(50),
                                markerId: const MarkerId("initial"),
                                position: googleController.from ??
                                    currentProvider.currentLocationData!),
                            Marker(
                                icon: BitmapDescriptor.defaultMarkerWithHue(80),
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
