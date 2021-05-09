part of 'operatorNameImports.dart';

class OperatorServices extends StatefulWidget {
  @override
  _OperatorServicesState createState() => _OperatorServicesState();
}

class _OperatorServicesState extends State<OperatorServices>
    with OperatorTabBarInfoData {
  bool icon = true;

  @override
  void initState() {
    onFetchProviderDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<ModelProviderDetails>,
        GenericState<ModelProviderDetails>>(
      bloc: operatorCubit,
      builder: (context, state) {
        if(state is GenericUpdateState)
          {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.6,
              child: ListView.builder(
                itemCount: state.data.data.services.length,
                itemBuilder:(context,index)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                  child: Text(state.data.data.services[index].name,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontWeight: FontWeight.bold),),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.22,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ListView.builder(
                                itemCount: state.data.data.services[index].types.length,
                                itemBuilder:(context,i)=> Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                      child: Container(
                                          width: MediaQuery.of(context).size.width*0.4,
                                          child: Text(state.data.data.services[index].types[i].name,style: TextStyle(color: Colors.purple[800],fontSize: 11,fontFamily: 'cairo',),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Text("|",style: TextStyle(color: Colors.purple[800],fontSize: 24,fontFamily: 'cairo'),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                      child: Text(state.data.data.services[index].types[i].duration.toString(),style: TextStyle(color: Colors.purple[800],fontSize: 11,fontFamily: 'cairo',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Text("|",style: TextStyle(color: Colors.purple[800],fontSize: 24,fontFamily: 'cairo'),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                      child: Text(state.data.data.services[index].types[i].price.toString(),style: TextStyle(color: Colors.purple[800],fontSize: 11,fontFamily: 'cairo',),),
                                    ),
                                    Padding(
                                      padding:const EdgeInsets.symmetric(horizontal: 15),
                                      child: IconButton(
                                        iconSize: 20,
                                        icon:icon?Icon(Icons.add_box_rounded,color: Colors.purple[800],):Icon(Icons.check_box_sharp,color: Colors.purple[800],),
                                        onPressed: (){
                                          setState(() {
                                            icon=false;
                                            showMaterialModalBottomSheet(
                                              isDismissible: true,
                                              enableDrag: false,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40) )),
                                              context: context,
                                              builder: (context) => Container(
                                                height: MediaQuery.of(context).size.height*0.40,
                                                decoration: BoxDecoration(
                                                    borderRadius:  BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40)
                                                    ),
                                                    color: Colors.white),
                                                child: ModalBottomSheetServices(state.data.data.services[index].types[i].id),
                                              ),
                                            );
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
