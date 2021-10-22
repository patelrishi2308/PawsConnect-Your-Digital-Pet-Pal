import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class LocationScreen extends StatelessWidget {
  static const String id = 'location-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        child: Text('Sign Out'),
        onPressed: (){
          FirebaseAuth.instance.signOut().then((value){
            Navigator.pushReplacementNamed(context, LoginScreen.id);

          });
        },
      ),),
    );
  }
}
