import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  @override
  void initState() {
    super.initState();
    setCustomMarker();

  }
  //google maps
  BitmapDescriptor mapMarker;
  Set<Marker> _markers = {};
  void setCustomMarker()async{
    mapMarker=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/icons/location.png');
  }
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('first'),
        infoWindow: InfoWindow(title: 'This place is so good'),
        position: LatLng(31.0409, 31.3785),
        icon: mapMarker
      )
      );
      _markers.add(Marker(
          markerId: MarkerId('second'),
          infoWindow: InfoWindow(title: 'This place is so good'),
          position: LatLng(32.0409, 31.3785),
          icon: mapMarker
      ));
    });
  }
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.0409, 31.3785),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(getTranslated(context, "googleMaps"),textAlign: TextAlign.center,),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated:_onMapCreated ,
        markers: _markers,
      ),
    );
  }
}
