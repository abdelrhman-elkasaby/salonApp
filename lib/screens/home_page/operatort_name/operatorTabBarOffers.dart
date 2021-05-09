part of 'operatorNameImports.dart';
class OperatorOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.6,
        color: Colors.white,
        child: Center(child: Text('لا يوجد عروض',style: TextStyle(fontFamily: 'cairo',fontSize: 16),),)
    );
  }
}
