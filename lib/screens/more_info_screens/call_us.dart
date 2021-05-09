import 'package:flutter/material.dart';
import 'package:flutter_frist_try/screens/localization/language_constant.dart';
class CallUs extends StatelessWidget {
  static const routeName="callUs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context,"callUs"),style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 220,),
            Text(getTranslated(context, "callTheFollowingNumbers"),style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 22),),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("966545123723+",style: TextStyle(color: Colors.purple[800]),),
                const SizedBox(width: 15,),
                Text("-",style: TextStyle(color: Colors.purple[800]),),
                const SizedBox(width: 15,),
                Text("966545123723+",style: TextStyle(color: Colors.purple[800]),)
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/icons/facebookiconcontact.png'),height: 25,width: 25,),
                const SizedBox(width: 30,),
                Image(image: AssetImage('assets/icons/twittericoncontact.png'),height: 25,width: 25,),
                const SizedBox(width: 30,),
                Image(image: AssetImage('assets/icons/instagramiconcontact.png'),height: 25,width: 25,),
                const SizedBox(width: 30,),
                Image(image: AssetImage('assets/icons/snapchaticoncontact.png'),height: 25,width: 25,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
