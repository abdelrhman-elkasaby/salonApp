part of 'operatorNameImports.dart';
class OperatorTabBarInfoData{
  final GenericCubit<ModelProviderDetails> operatorCubit = GenericCubit(null);

  onFetchProviderDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    var providerId = preferences.getInt('providerId');
    print(providerId);
    Map<String, dynamic> body = {
      'provider_id': providerId,
      'lang': 'ar',
      'user_id': userId
    };
    var response =
    await Utils().api().post(url: 'provider-details', body: body);
    ModelProviderDetails modelProviderDetails =
    ModelProviderDetails.fromJson(response.data);
    operatorCubit.onUpdateData(modelProviderDetails);
  }
  Widget buildTextTitle(String textTitle){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        textTitle,
        style: TextStyle(
            color: Colors.purple[800],
            fontFamily: 'cairo',
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
    );
  }
  BitmapDescriptor mapMarker;
  Set<Marker> _markers = {};
  double lat;
  double lang;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/icons/placeholder.png');
  }

}