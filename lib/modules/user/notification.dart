import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class JourneyNotification extends StatelessWidget {
  const JourneyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<Controller>(builder: (context, controller, child) {
          return StreamBuilder(
              stream: controller.getCurrentUserJournyNotification().asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
 final data = controller.journeyList;
                if (snapshot.hasData) {
                  
                  // final stramSnap=snapshot.data;
                  // log(stramSnap[0]["uid"]);
                 
                  // log(data.length.toString()??"gggvg");
                  return data.isEmpty
                      ? const Center(
                          child: Text("Empty"),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                                  future: controller
                                      .getSelecteduserData(data[index].uid),
                                  builder: (context, snaps) {
                                    if (snaps.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox();
                                    }

                                    final userData =
                                        controller.selectedUserData;
                                return Container(
                                  decoration:
                                       BoxDecoration(color:data[index].isJouneryEnd==true?Color.fromARGB(255, 172, 171, 171): Colors.black),
                                  // height: 100,
                                  child: Column(
                                          children: [
                                            //  Text(
                                            //             ddd[index][0]["currentLon"].toString(),
                                            //                 style: GoogleFonts.inder(
                                            //                     color: const Color
                                            //                         .fromARGB(255, 255,
                                            //                         255, 255)),
                                            //               ),
                                             
                                            Text(
                                              userData!.name,
                                              style: GoogleFonts.inder(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                              FutureBuilder(
                                                  future: controller.getFromAndTo(
                                                      data[index].fromLat,
                                                      data[index].fromLon,
                                                      data[index].toLat,
                                                      data[index].toLon),
                                                  builder: (context, snapshot1) {
                                                    if (snapshot1.connectionState ==
                                                        ConnectionState.waiting) {
                                                      return SizedBox();
                                                    }
                                                    final from =
                                                        controller.fromLocality;
                                                    final to = controller.toLocality
                                                        .toString();
                                
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                        "Journey start from : ${ from!}",
                                                          style: GoogleFonts.inder(
                                                              color: const Color
                                                                  .fromARGB(255, 255,
                                                                  255, 255)),
                                                        ),
                                                        Text(
                                                          "to : $to",
                                                          style: GoogleFonts.inder(
                                                              color: const Color
                                                                  .fromARGB(255, 255,
                                                                  255, 255)),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                  FutureBuilder(
                                                    future: controller.getCurrentLocationAddress(data[index].currentLat,data[index].currentLon),
                                                    builder: (context,snaps2) {
                                                      if(snaps2.connectionState==ConnectionState.waiting){
                                                        return SizedBox();
                                                      }
                                                      final currentLocation=controller.currentLocation;
                                                      return  data[index].isJouneryEnd==true?Text(
                                                            "Reached in : $currentLocation",
                                                              style: GoogleFonts.inder(
                                                                  color: const Color
                                                                      .fromARGB(255, 255,
                                                                      255, 255)),
                                                            ): Text(
                                                            "Current Location : $currentLocation",
                                                              style: GoogleFonts.inder(
                                                                  color: const Color
                                                                      .fromARGB(255, 255,
                                                                      255, 255)),
                                                            );
                                                    }
                                                  ),
                                                  // Text(
                                                  //           "Current Position : ${data[index].currentLat.toString()}  :  ${data[index].currentLon.toString()}",
                                                  //             style: GoogleFonts.inder(
                                                  //               fontSize:8,
                                                  //                 color: const Color
                                                  //                   .fromARGB(255, 255,
                                                  //                   255, 255)),
                                                  //         ),
                                          ],
                                        ));
                              }
                            
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: data.length);
                } else {
                  return const Center(child: Text("No Notificatios"));
                }
              });
        }),
      ),
      // body: ,
      // body: Stack(
      //   children: [

      //     Padding(
      //       padding: const EdgeInsets.all(20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           SizedBox(height: 100),

      //     // Back Button
      //   //   Positioned(
      //   //     top: 30,
      //   //     left: 10,
      //   //     child: IconButton(
      //   //       icon: Icon(Icons.arrow_back),
      //   //       onPressed: () {
      //   //         Navigator.push(
      //   //           context,
      //   //           MaterialPageRoute(builder: (context) => Home()),
      //   //         );
      //   //       },
      //   //     ),
      //     ),
      //   ],
      // ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            
          ),
         
        Center(
          child: ElevatedButton(
            onPressed: (){
          
            },
            
            
            child: Text('Track',
             style: GoogleFonts.inder(color: Colors.black),),
          ),
        ),
          Positioned(
            top: 30, // Adjust this value to position the arrow vertically
            left: 10, // Adjust this value to position the arrow horizontally
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);

               
              },
            ),
          ),
        ],
      ),
    );
  }
}*/
