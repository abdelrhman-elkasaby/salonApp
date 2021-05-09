import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
class RestorePassword extends StatefulWidget {
  static const routeName = 'restorePassword';
  @override
  _RestorePasswordState createState() => _RestorePasswordState();
}
class _RestorePasswordState extends State<RestorePassword> {
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
                child: Text(
                  getTranslated(context,"pleaseEnterTheCode"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    hintText: getTranslated(context,"validationCode"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    hintText:
                    getTranslated(context,"newPassword"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    filled: true,
                    fillColor: Colors.purple.withOpacity(0.2),
                    hintText: getTranslated(context,"confirmNewPassword"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
                child: RaisedButton(
                  color: Colors.purple[900],
                  child: Center(
                    child: Text(
                      getTranslated(context,"confirmButton"),
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
                  onPressed: () {},
                ),
              ), //button Login
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: InkWell(
                  child: Text(
                      getTranslated(context,"didn'tReceiveTheCode"),
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
