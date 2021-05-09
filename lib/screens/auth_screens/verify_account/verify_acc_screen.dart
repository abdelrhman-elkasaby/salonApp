import 'package:flutter/material.dart';
import 'package:flutter_frist_try/providers/auth_provider.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'package:provider/provider.dart';
class VerifyAcc extends StatefulWidget {

  static const routeName='verifyAcc';
  @override
  _VerifyAccState createState() => _VerifyAccState();
}

class _VerifyAccState extends State<VerifyAcc>{
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
                padding:const EdgeInsets.only( top: 80),
                child: Text(getTranslated(context,"verifyAccount"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ), //text
              Padding(
                padding:const EdgeInsets.only(top: 1),
                child: Text(getTranslated(context,"pleaseEnterTheCode"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ), //text
              Padding(
                  padding:const EdgeInsets.only(
                    top: 50,
                    bottom: 70,
                  ),
                  child: Image(
                    image: AssetImage('assets/icons/logotwo.png'),
                    width: 100,
                    height: 100,
                  )), //image
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: Provider.of<AuthProvider>(context,listen: false).formKey3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.2),
                      hintText:getTranslated(context,"codeNumber"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'please enter code';
                        }else if(val.length < 4 && val.length>4){
                          return 'please enter the correct code';
                        }
                        return null;
                      },
                      onSaved: (val) {
                       Provider.of<AuthProvider>(context,listen: false).code = val;
                      }
                  ),
                ),
              ),

              Padding(
                padding:const EdgeInsets.only(top: 30,right: 15, left: 15),
                child: RaisedButton(
                  color: Colors.purple[900],
                  child: Center(
                    child: Text(getTranslated(context,"confirmButton"),
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  onPressed: (){
                    if (! Provider.of<AuthProvider>(context,listen: false).formKey3.currentState.validate()) {
                      return;
                    }else{
                      Provider.of<AuthProvider>(context,listen: false).onVerify(context);
                    }

                  },
                ),
              ), //button Login
              Padding(
                padding:const EdgeInsets.only(top: 5),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: (){},
                          child: Padding(
                            padding:const EdgeInsets.only(right: 8),
                            child: Text(
                                getTranslated(context,"didn'tReceiveTheCode"),
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
