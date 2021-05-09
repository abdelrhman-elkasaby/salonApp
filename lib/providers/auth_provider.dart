import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_frist_try/my_info/utils/Utils.dart';
import 'package:flutter_frist_try/screens/auth_screens/login/login_screen.dart';
import 'package:flutter_frist_try/screens/auth_screens/verify_account/verify_acc_screen.dart';
import 'package:flutter_frist_try/screens/routePage/route_page_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider with ChangeNotifier{
  int id;
  String key;
  bool rememberMe = false;
  Map<String, String> authData = {'phone': '', 'password': ''};
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  Map<String, String> authDataSignUp = {'userName': '', 'phone': '','password':''};
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool rememberMeTerms = false;
  String code;
  int userId;
  final formKey3 = GlobalKey<FormState>();
  String keyVerify;

  void onLogin(BuildContext context) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
    showLoadingDialog(context);
    if (!formKey.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    formKey.currentState.save();
    Map  <String,dynamic>body = {
      'phone': authData['phone'],
      'password': authData['password'],
      'device_id': '12',
      'device_type': 'android',
      'lang': 'ar'
    };
    Response res=await Utils().api().post(url:"sign-in", body: body);
    key=res.data['key'];
    if(key.contains('success')){
       id=res.data['data']['id'];
       preferences.setBool('isLogin', true);
       preferences.setInt('userId', res.data['data']['id']);
      Navigator.of(context).pushReplacementNamed(RoutePage.routeName);
    }else{
      EasyLoading.dismiss();
      BotToast.showSimpleNotification(title: 'Wrong number or password');
    }
    EasyLoading.dismiss();
    notifyListeners();
  }
  onLogout(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    print(userId);
    showLoadingDialog(context);
    Map  <String,dynamic>body={
      "user_id":userId,
      "device_id":"98761232142821312423",
      "lang":"ar"
    };
    await Utils().api().post(url:"log-out",body: body);
    print("5555555555555555555 $userId");
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    preferences.setBool('isLogin', false);
    EasyLoading.dismiss();
    notifyListeners();
  }
  onSignUp(BuildContext context) async{
    showLoadingDialog(context);
    if (!formKey2.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    formKey2.currentState.save();
    Map <String,dynamic>body = {
      'name':authDataSignUp['userName'],
      'phone': authDataSignUp['phone'],
      'password': authDataSignUp['password'],
      'device_id': '12',
      'device_type': 'android',
    };
    Response res=await Utils().api().post(url:"sign-up",body: body);
    String key=res.data['key'];
    if(key.contains('success')){
      userId=res.data['data']['id'];
      Navigator.of(context).pushReplacementNamed(VerifyAcc.routeName);
    }else{
      EasyLoading.dismiss();
      return BotToast.showSimpleNotification(title: 'This phone is already in use');
    }
    print(authDataSignUp['phone']);
    print(authDataSignUp['password']);
    print(authDataSignUp['userName']);
    EasyLoading.dismiss();
    notifyListeners();
  }
  onVerify(BuildContext context)async{
    showLoadingDialog(context);
    if (!formKey3.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    formKey3.currentState.save();
    Map <String,dynamic>body={
      "user_id":userId,
      "code":code
    };
    Response res=await Utils().api().post(url:"code-sign-up",body:body );
    keyVerify =res.data['key'];
    if(keyVerify.contains('success')){
      // String phone =res.data['data']['phone'];
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }else{
      EasyLoading.dismiss();
      return BotToast.showSimpleNotification(title: "Wrong Code number Please enter the correct code");
    }

    EasyLoading.dismiss();
  }
  void showLoadingDialog(BuildContext context) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: 'Loading...',
      indicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
    notifyListeners();
  }
}