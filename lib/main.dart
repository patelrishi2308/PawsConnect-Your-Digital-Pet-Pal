import 'package:flutter/material.dart';
import 'package:pet_adoption/screens/authentication/phoneauth_screen.dart';
import 'package:pet_adoption/screens/home_screen.dart';
import 'package:pet_adoption/screens/location_screen.dart';
import 'package:pet_adoption/screens/login_screen.dart';
import 'package:pet_adoption/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan.shade900,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
        LocationScreen.id: (context) => LocationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
