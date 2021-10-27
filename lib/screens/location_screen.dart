import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class LocationScreen extends StatelessWidget {
  static const String id = 'location-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/location.png'),
        ],
      )
    );
  }
}
