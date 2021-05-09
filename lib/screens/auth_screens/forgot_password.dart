import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/auth_screens/restore_password.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
class ForgetPassword extends StatefulWidget {
  static const routeName = 'forgotPassword';

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(getTranslated(context,"restorePassword"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ), //text
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(getTranslated(context,"hintUnderRestorePassword"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ), //text
              Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 70,
                  ),
                  child: Image(
                    image: AssetImage('assets/icons/logotwo.png'),
                    width: 100,
                    height: 100,
                  )), //image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    hintText:getTranslated(context,"phone"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
                child: RaisedButton(
                  color: Colors.purple[800],
                  child: Center(
                    child: Text(getTranslated(context,"sendButton"),
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(RestorePassword.routeName),
                ),
              ), //button Login
            ],
          ),
        ),
      ),
    );
  }
}
