part of 'operatorNameImports.dart';

class OperatorInformation extends StatefulWidget {
  @override
  _OperatorInformationState createState() => _OperatorInformationState();
}
class _OperatorInformationState extends State<OperatorInformation>
    with OperatorTabBarInfoData {
  @override
  void initState() {
    onFetchProviderDetails();
    setCustomMarker();
    super.initState();
  }
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('first'),
          infoWindow: InfoWindow(title: 'second'),
          position: LatLng(lat, lang),
          icon: mapMarker));
      _markers.add(Marker(
          markerId: MarkerId('second'),
          infoWindow: InfoWindow(title: 'This place is so good'),
          position: LatLng(32.0409, 31.3785),
          icon: mapMarker));
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<ModelProviderDetails>,
        GenericState<ModelProviderDetails>>(
      bloc: operatorCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.data.data.info.name,
                          style: TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 13,
                              color: Colors.purple[800],
                              fontWeight: FontWeight.bold),
                        ),
                        SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: 5,
                            rating: state.data.data.info.rate.toDouble(),
                            size: 16.0,
                            isReadOnly: false,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            spacing: 0.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage('assets/icons/placeholder.png'),
                          height: 20,
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            state.data.data.info.address,
                            style: TextStyle(
                                color: Colors.purple[800],
                                fontFamily: 'cairo',
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  buildTextTitle(getTranslated(context, "description")),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Text(
                      state.data.data.info.description,
                      style: TextStyle(
                          color: Colors.purple[800],
                          fontFamily: 'cairo',
                          fontSize: 11),
                    ),
                  ),
                  buildTextTitle(getTranslated(context, "timesOfWork")),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Text(
                      '${getTranslated(context, "fromTime")}${state.data.data.info.startTime}${getTranslated(context, 'toTime')}${state.data.data.info.endTime}',
                      style: TextStyle(
                          color: Colors.purple[800],
                          fontFamily: 'cairo',
                          fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              lat = double.parse(state.data.data.info.lat),
                              lang = double.parse(state.data.data.info.lng)),
                          zoom: 14.4746,
                        ),
                        onMapCreated: _onMapCreated,
                        markers: _markers,
                      ),
                    ),
                  ),
                ],
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
