import 'package:flutter/material.dart';
import 'package:flutter_frist_try/providers/auth_provider.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'package:provider/provider.dart';
import '../../auth_screens/forgot_password.dart';
import '../signup/signup_screen.dart';
class LoginScreen extends StatefulWidget {
  static const routeName = 'loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.grey.withOpacity(0.1),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                       getTranslated(context,'loginText'),
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
            ), //text
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                getTranslated(context,"hintUnderLoginText"),
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
            ), //text
            Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 25,
                ),
                child: Image(
                  image: AssetImage('assets/icons/logotwo.png'),
                  width: 100,
                  height: 100,
                )), //image
            //textFormField
            Form(
              key: Provider.of<AuthProvider>(context,listen: false).formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        // enabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.purple.withOpacity(0.2),

                        hintText: getTranslated(context,"phone"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return getTranslated(context,"phoneEmpty");
                        } else if (val.length < 11) {
                          return getTranslated(context,"phoneLessThan11");
                        }
                        return null;
                      },
                      onSaved: (val) {
                        Provider.of<AuthProvider>(context,listen: false).authData['phone'] = val;
                      },
                    ),
                  ), //textFormField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          filled: true,
                          fillColor: Colors.purple.withOpacity(0.2),
                          hintText: getTranslated(context,"password"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return getTranslated(context,"passwordEmpty");
                          } else if (val.length < 6) {
                            return getTranslated(context,"passwordLessThan6");
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Provider.of<AuthProvider>(context,listen: false).authData['password'] = val;
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 15),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.yellow,
                    value: Provider.of<AuthProvider>(context,listen: false).rememberMe,
                    onChanged: (val) {
                      setState(() {
                        Provider.of<AuthProvider>(context,listen: false).rememberMe = val;
                      });
                    },
                  ),
                  Text(
                    getTranslated(context,"rememberMe"),
                    style: TextStyle(
                        color: Colors.yellow[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: RaisedButton(
                color: Colors.purple[900],
                child: Center(
                  child: Text(
                    getTranslated(context,"loginText"),
                    style: TextStyle(
                        color: Colors.yellow[600],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: () async{
                  if (!Provider.of<AuthProvider>(context,listen: false).formKey.currentState.validate()){
                    return;
                  }else{
                    Provider.of<AuthProvider>(context,listen: false).onLogin(context);
                  }
                },
              ),
            ), //button Login
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: FlatButton(
                child: Text(
                  getTranslated(context,"forgotPassword"),
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(ForgetPassword.routeName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      getTranslated(context,"don'tHaveAccount"),
                      style: TextStyle(
                          color: Colors.purple[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(SignUp.routeName),
                        child: Text(getTranslated(context,"signUpText"),
                            style: TextStyle(
                                color: Colors.yellow[600],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,fontFamily: 'cairo')))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
