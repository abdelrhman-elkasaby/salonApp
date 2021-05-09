part of 'cartReservationImports.dart';
class CartReservationData{
  Widget buildRowServicePrice(String title,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 12),),
        SizedBox(width: 4,),
        Text(":"),
        SizedBox(width: 5,),
        Text('$value رس ',style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 11),),
      ],
    );
  }
  Widget buildRowService(String title,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 12),),
        SizedBox(width: 4,),
        Text(":"),
        SizedBox(width: 5,),
        Text('$value',style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 11),),
      ],
    );
  }
  final GenericCubit<ModelDeleteCart> deleteCartCubit=GenericCubit<ModelDeleteCart>(null);
  onDeleteCartData(String reservationId)async{

    Map<String,dynamic> body={
      'reservation_id':reservationId,
      'lang':'ar'
    };
    var response = await Utils().api().post(url: 'delete-cart', body: body);
    ModelDeleteCart modelDeleteCart = ModelDeleteCart.fromJson(response.data);
    deleteCartCubit.onUpdateData(modelDeleteCart);
  }
  final GenericCubit<ModelCartDetails> cartDataCubit=GenericCubit<ModelCartDetails>(null);
  onFetchCartData(dynamic providerId)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    Map<String,dynamic> body={
      'user_id':userId,
      'provider_id':providerId.toString()
    };
    var response = await Utils().api().post(url: 'cart-details', body: body);
    ModelCartDetails modelCartDetails = ModelCartDetails.fromJson(response.data);
    cartDataCubit.onUpdateData(modelCartDetails);

  }
}