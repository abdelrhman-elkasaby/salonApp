

part of 'modalBottomSheetImports.dart';
class ModalBottomSheetData{
  String dateTime;
  String timePicker;
  final GenericCubit<ModelAddCart> modelBottomSheetCubit=GenericCubit<ModelAddCart>(null);
  onAddToCart(dynamic typeId,BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    Map<String,dynamic> body={
      'user_id':userId,
      'type_id':typeId,
      'date':dateTime,
      'time':timePicker
    };
    var response = await Utils().api().post(url: 'add-cart', body: body);
    ModelAddCart modelAddCart = ModelAddCart.fromJson(response.data);
    modelBottomSheetCubit.onUpdateData(modelAddCart);
    if(modelAddCart.key.contains('success')){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>CartScreen()));
    }
  }

}