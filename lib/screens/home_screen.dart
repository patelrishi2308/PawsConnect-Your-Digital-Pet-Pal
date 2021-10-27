import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';


  final LocationData locationData;
  HomeScreen({this.locationData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String address = 'India';
  
  Future<String>getAddress()async{

    final coordinates = new Coordinates(1.10, 45.50);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      address = first.addressLine;
    });
    return first.addressLine;

  }

  @override
  void initState() {
    getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        title: Row(
          children: [
            Icon(
              CupertinoIcons.location_solid,
              color: Colors.black,
              size: 18,
            ),
            Text(
              address,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
          ],
        ),
      ),
      body: Center(child: Text('Home Screen'),),
    );
  }
}
