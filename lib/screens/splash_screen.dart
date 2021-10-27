import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(
      Duration(
        seconds: 3,
      ), () {
        FirebaseAuth.instance.authStateChanges().listen((User user) {
          if (user == null){
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          } else {
            Navigator.pushReplacementNamed(context, LocationScreen.id);
          }
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.cyan,

    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );


    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                'images/dog.png',
                scale: 0.6,
                color:Colors.white
            ),
            SizedBox(
              height: 10,
            ),

        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Pet-Adoption',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        )

          ],

        ),),
    );
  }
}
