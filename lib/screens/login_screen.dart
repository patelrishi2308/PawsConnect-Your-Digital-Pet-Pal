import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/screens/location_screen.dart';
import 'package:pet_adoption/widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  static const String id= 'login-screen';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Column(
        children: [
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 100,),
                Image.asset('images/dog.png',
                  scale: 0.6,
                  color: Colors.cyan.shade900,
                ),
                SizedBox(height: 10,),
                Text('Pet-Adoption',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan.shade900
                ),)
              ],
            ),
          ),),
          Expanded(child: Container(
            child: AuthUi(),
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'If you continue, you are accepting\n Terms and Conditions and Privacy Policy',
            textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
          )
        ],
      )
    );
  }
}
