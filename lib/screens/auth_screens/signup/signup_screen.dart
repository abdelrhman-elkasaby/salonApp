import 'package:flutter/material.dart';
import 'package:flutter_frist_try/providers/auth_provider.dart';
import 'package:flutter_frist_try/screens/termsAndConditions/termsAndConditionsImports.dart';
import 'package:provider/provider.dart';
import '../../localization/language_constant.dart';
import '../login/login_screen.dart';
class SignUp extends StatefulWidget {
  static const routeName = 'SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
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
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  getTranslated(context,"signUpText"),
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
                  getTranslated(context,"hintUnderSignUpText"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ), //text
              Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 45,
                  ),
                  child: Image(
                    image: AssetImage('assets/icons/logotwo.png'),
                    width: 100,
                    height: 100,
                  )), //image
              Form(
                key: Provider.of<AuthProvider>(context,listen: false).formKey2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          filled: true,
                          fillColor: Colors.purple.withOpacity(0.2),
                          hintText: getTranslated(context,"userName"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated(context,"userNameEmpty");
                            } else if (val.length < 3) {
                              return getTranslated(context,"userNameLessThan3");
                            }
                            return null;
                          },
                          onSaved: (val) {
                            Provider.of<AuthProvider>(context,listen: false).authDataSignUp['userName'] = val;
                          }
                      ),
                    ),
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
                            Provider.of<AuthProvider>(context,listen: false).authDataSignUp['phone'] = val;
                          }
                      ),
                    ), //textFormField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                          controller: Provider.of<AuthProvider>(context,listen: false).passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                            Provider.of<AuthProvider>(context,listen: false).authDataSignUp['password'] = val;
                          }
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: TextFormField(
                          obscureText: true,
                          controller: Provider.of<AuthProvider>(context,listen: false).confirmPasswordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            filled: true,
                            fillColor: Colors.purple.withOpacity(0.2),
                            hintText:getTranslated(context,"ConfirmPassword"),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return getTranslated(context,"passwordEmpty");
                            } else if (val != Provider.of<AuthProvider>(context,listen: false).passwordController.text) {
                              return getTranslated(context,"passwordNotEqual");
                            }
                            return null;
                          }
                      ),
                    ),
                  ],
                ),
              ),
               //textFormField
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  getTranslated(context,"hintUnderConfirmPassword"),
                  style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 1),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.amber,
                      value: Provider.of<AuthProvider>(context,listen: false).rememberMeTerms,
                      onChanged: (val) {
                        setState(() {
                          Provider.of<AuthProvider>(context,listen: false).rememberMeTerms = val;
                        });
                      },
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(TermsAndConditions.routeName),
                        child: Text(
                          getTranslated(context,"termsAndConditions"),
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: RaisedButton(
                    color: Colors.purple[900],
                    child: Center(
                      child: Text(
                        getTranslated(context,"signUpText"),
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      if (!Provider.of<AuthProvider>(context,listen: false).formKey2.currentState.validate()) {
                        return;
                      }else{
                        Provider.of<AuthProvider>(context,listen: false).onSignUp(context);
                      }
                    }),
              ), //button Login
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTranslated(context,"alreadyHaveAccount"),
                        style: TextStyle(
                            color: Colors.purple[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                                getTranslated(context,"loginText"),
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
