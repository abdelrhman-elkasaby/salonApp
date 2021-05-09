import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
import 'ordersCard.dart';
class OrderDetails extends StatefulWidget {
  static const routeName="orderDetails";
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Widget buildRowService(String title,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 12),),
        SizedBox(width: 4,),
        Text(":"),
        SizedBox(width: 5,),
        Text(value,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 11),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context, "orderDetails"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo'),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CardOrder("assets/images/flutter.jpg",
                  getTranslated(context, "operatorName"), 112),
            ),
            const SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25)
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/icons/logotwo.png'),height: 40,width: 40),
                          Text(getTranslated(context, "orderNumber"),style: TextStyle(color: Colors.amber,fontFamily: 'cairo',fontSize: 12),),
                          Text("100",style: TextStyle(color: Colors.amber,fontFamily: 'cairo',fontSize: 12))
                        ],
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: MediaQuery.of(context).size.height*0.15,
                        width: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, "serviceDetails"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 13),),
                          buildRowService(getTranslated(context, "kindOfService"), getTranslated(context, "hairCut")),
                          buildRowService(getTranslated(context, "servicePrice"), "100رس"),
                          buildRowService(getTranslated(context, "serviceTime"), "5:30 pm"),
                          buildRowService(getTranslated(context, "serviceDate"), "27/3/2021"),
                          buildRowService(getTranslated(context, "employeeName"), getTranslated(context, "employeeName"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/icons/logotwo.png'),height: 40,width: 40),
                          Text(getTranslated(context, "orderNumber"),style: TextStyle(color: Colors.amber,fontFamily: 'cairo',fontSize: 12),),
                          Text("100",style: TextStyle(color: Colors.amber,fontFamily: 'cairo',fontSize: 12))
                        ],
                      ),
                      const SizedBox(width: 15,),
                      Container(
                        height: MediaQuery.of(context).size.height*0.15,
                        width: 2,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, "serviceDetails"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 13),),
                          buildRowService(getTranslated(context, "kindOfService"), getTranslated(context, "hairCut")),
                          buildRowService(getTranslated(context, "servicePrice"), "100رس"),
                          buildRowService(getTranslated(context, "serviceTime"), "5:30 pm"),
                          buildRowService(getTranslated(context, "serviceDate"), "27/3/2021"),
                          buildRowService(getTranslated(context, "employeeName"), getTranslated(context, "employeeName"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
          child: Text(getTranslated(context,"cancelOrder"),style: TextStyle(color: Colors.amber,fontFamily: 'cairo'),),
        ),
      ),
    );
  }
}
