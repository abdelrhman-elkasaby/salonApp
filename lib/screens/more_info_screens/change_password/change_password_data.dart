part of 'change_password_imports.dart';
class ChangePasswordData{
  final formKey = GlobalKey<FormState>();
  TextEditingController oldPassWordController=TextEditingController();
  TextEditingController newPassWordController=TextEditingController();
  TextEditingController confirmNewPassWordController=TextEditingController();
  final GenericCubit<ModelChangePassword> changePasswordCubit=GenericCubit<ModelChangePassword>(null);
  onChangePasswordData(BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    print(userId);

    Map <String,dynamic>body={
      'user_id':userId,
      'old_password':oldPassWordController.text,
      'new_password':newPassWordController.text
    };
    var response = await Utils().api().post(url: 'change-password', body: body);
    ModelChangePassword modelChangePassword = ModelChangePassword.fromJson(response.data);
    changePasswordCubit.onUpdateData(modelChangePassword);
    if(modelChangePassword.key.contains('success')){
      Navigator.of(context).pushReplacementNamed(AccountInformation.routeName);
    }
  }
}