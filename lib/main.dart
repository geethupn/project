import 'package:firebase_core/firebase_core.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/firebase_options.dart';
import 'package:flutter_application_1/modules/admin/Admin3.dart';
import 'package:flutter_application_1/modules/user/Home.dart';
import 'package:flutter_application_1/modules/user/first.dart';
import 'package:flutter_application_1/viewmodel/controller.dart';
import 'package:flutter_application_1/viewmodel/current_location_provider.dart';
import 'package:provider/provider.dart';
  
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [  ChangeNotifierProvider<CurrentLocationProvider>(
            create: (_) => CurrentLocationProvider()),
            ChangeNotifierProvider<Controller>(
            create: (_) => Controller())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      home:Home()
        //  home: first(),
        //home: Admin3(),
         
        
      ),
    );
  }
}
// //////////////////////////////////////////
