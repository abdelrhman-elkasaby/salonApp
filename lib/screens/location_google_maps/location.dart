import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
class LocationGoogleMaps extends StatefulWidget {

  @override
  _LocationGoogleMapsState createState() => _LocationGoogleMapsState();
}

class _LocationGoogleMapsState extends State<LocationGoogleMaps> {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  @override
  void initState(){
    super.initState();
    checkLocationServiceInDevice();
  }

  Future<void> checkLocationServiceInDevice()async{
    _serviceEnabled=await location.serviceEnabled();
    if(_serviceEnabled){
      _permissionGranted=await location.hasPermission();
      if(_permissionGranted==PermissionStatus.granted){

        _locationData=await location.getLocation();
        print(_locationData.toString());
        // location.onLocationChanged.listen((LocationData currentLocation) {
        //   print(currentLocation.toString());
        // });

      }else{
        _permissionGranted=await location.requestPermission();
        if(_permissionGranted==PermissionStatus.granted){

          _locationData=await location.getLocation();
          print(_locationData.toString());
          // location.onLocationChanged.listen((LocationData currentLocation) {
          //   print(currentLocation.toString());
        }else{
          SystemNavigator.pop();
        }
      }
    }else{
      _serviceEnabled=await location.requestService();
      if(_serviceEnabled){
        _permissionGranted=await location.hasPermission();
        if(_permissionGranted==PermissionStatus.granted){

          _locationData=await location.getLocation();
          print(_locationData.toString());
          // location.onLocationChanged.listen((LocationData currentLocation) {
          //   print(currentLocation.toString());
          // });
        }else{
          _permissionGranted=await location.requestPermission();
          if(_permissionGranted==PermissionStatus.granted){

            _locationData=await location.getLocation();
            print(_locationData.toString());
            // location.onLocationChanged.listen((LocationData currentLocation) {
            //   print(currentLocation.toString());
            // });
          }else{
            SystemNavigator.pop();
          }
        }
      }else{
        SystemNavigator.pop();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Location'),
      ),
    );
  }
}

