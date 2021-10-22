import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pet_adoption/screens/authentication/phoneauth_screen.dart';

class AuthUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)
              ),
              onPressed: () {
                Navigator.pushNamed(context, PhoneAuthScreen.id);
              },
              child: Row(
              children: [
                Icon(Icons.phone_android_outlined,color: Colors.black,),
                SizedBox(width: 8,),
                Text('Continue with Phone',style: TextStyle(color: Colors.black),)
              ],
            ),),
          ),
          SignInButton(
              Buttons.Google,
              text: ('Continue with Google'),
              onPressed: () {},
          ),
          SignInButton(
            Buttons.FacebookNew,
            text: ('Continue with Facebook'),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('OR',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Login with Email',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),),
          ),
        ],
      ),
    );
  }
}
