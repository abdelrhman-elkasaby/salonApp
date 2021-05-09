import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
class ChoosePaymentMethod extends StatefulWidget {
  static const routeName="choosePaymentMethod";
  @override
  _ChoosePaymentMethodState createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  int groupValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple[800],
          size: 30,
        ),
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context,"choosePaymentMethod"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo'),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 1,
                    groupValue:groupValue,
                    onChanged: (val){
                      setState(() {
                        groupValue=val;
                      });
                    },
                  ),
                  Text(getTranslated(context, "cash"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo'),),
                  Image(image: AssetImage('assets/icons/coins.png'),width: 40,height: 40,),

                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 2,
                  groupValue:groupValue,
                  onChanged: (val){
                    setState(() {
                      groupValue=val;
                    });
                  },
                ),
                Text(getTranslated(context, "onlinePayment"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo'),),
                Image(image: AssetImage('assets/icons/online.png'),width: 40,height: 40,)
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.purple[800],borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),

        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)))
          ),
          child: Text(getTranslated(context,"confirmButton"),style: TextStyle(color: Colors.amber,fontFamily: 'cairo'),),
        ),
      ),
    );
  }
}
