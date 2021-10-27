import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';


  final LocationData locationData;
  HomeScreen({this.locationData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationData.latitude.toString()),
      ),
      body: Center(child: Text('Home Screen'),),
    );
  }
}
