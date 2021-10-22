import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
