part of 'cartScreenImports.dart';
class CartScreenData{
  final GenericCubit<ModelMyCart> cartCubit=GenericCubit<ModelMyCart>(null);
  onFetchCartData()async{

    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    Map<String,dynamic> body={
      'user_id':userId
    };
    var response = await Utils().api().post(url: 'my-cart', body: body);
    ModelMyCart modelMyCart = ModelMyCart.fromJson(response.data);
    cartCubit.onUpdateData(modelMyCart);
  }
}