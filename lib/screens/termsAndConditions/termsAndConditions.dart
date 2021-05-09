part of 'termsAndConditionsImports.dart';
class TermsAndConditions extends StatefulWidget {
  static const routeName='termsAndConditionsScreen';
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> with TermsAndConditionsData{
  @override
  void initState() {
    onFetchTermsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context,"termsAndConditions"),
          style: TextStyle(
            color: Colors.purple[800],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body:BlocBuilder<GenericCubit<ModelTerm>, GenericState<ModelTerm>>(
        bloc: termCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(child: ListView(
                    children: [
                      Text(state.data.data,style: TextStyle(fontFamily: 'cairo'),),
                    ],
                  ),),
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
        },
       ),
    );
  }
}
