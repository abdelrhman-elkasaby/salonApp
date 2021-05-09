
part of 'who_we_are_imports.dart';
class WhoWeAre extends StatefulWidget {
  static const routeName="whoWeAre";
  @override
  _WhoWeAreState createState() => _WhoWeAreState();
}
class _WhoWeAreState extends State<WhoWeAre> with WhoWeAreData{
  
  @override
  void initState() {
    onFetchAboutUsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context,"whoWeAre"),style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: true,
      ),
      body:BlocBuilder<GenericCubit<ModelTerm>, GenericState<ModelTerm>>(
        bloc: aboutUsCubit,
           builder: (context, state) {
              if(state is GenericUpdateState)
                {
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
