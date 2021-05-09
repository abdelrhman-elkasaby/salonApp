import 'package:flutter/material.dart';
import '../localization/language_constant.dart';
class CardOrder extends StatelessWidget {
  final String imageUrl;
  final String operatorName;
  final int requestNumber;
  const CardOrder(
      this.imageUrl,
      this.operatorName,
      this.requestNumber
      );
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                operatorName,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple[800],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${getTranslated(context, "requestNumber")} : $requestNumber",style: TextStyle(color: Colors.purple[800]),)
            ],
          )
        ],
      ),
    );
  }
}
