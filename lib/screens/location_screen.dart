import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pet_adoption/screens/home_screen.dart';
import 'login_screen.dart';

class LocationScreen extends StatefulWidget {
  static const String id = 'location-screen';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  bool _loading = false;
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<LocationData>getLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

      _locationData = await location.getLocation();

    print(_locationData);


    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('images/location.png'),
          SizedBox(
            height: 20,
          ),
          Text('Where do want\nto shelter/adopt pet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('To enjoy all that we havw to offer you\nwe need to know where to look for them',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: _loading ? Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                  )): ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)
                    ),
                    icon: Icon(CupertinoIcons.location_fill),
                    label: Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Text(
                        'Around me',style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        _loading = true;
                      });
                      getLocation().then((value) {
                        print(_locationData.latitude);

                        if (value!= null) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen(locationData: _locationData,),),);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: (){},
            child: Text(
              'Set location manually',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
