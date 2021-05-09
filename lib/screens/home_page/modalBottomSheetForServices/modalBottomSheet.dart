part of 'modalBottomSheetImports.dart';

class ModalBottomSheetServices extends StatefulWidget {
  final typeId;

  const ModalBottomSheetServices(this.typeId);

  @override
  _ModalBottomSheetServicesState createState() =>
      _ModalBottomSheetServicesState();
}

class _ModalBottomSheetServicesState extends State<ModalBottomSheetServices>
    with ModalBottomSheetData {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<ModelAddCart>, GenericState<ModelAddCart>>(
      bloc: modelBottomSheetCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(getTranslated(context,"chooseDate"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontWeight: FontWeight.bold),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child:Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40)),
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: InkWell(
                      onTap: ()async{
                        await Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
                          appBar: AppBar(
                            elevation: 0.0,
                            iconTheme: IconThemeData(
                                color: Colors.purple[800],
                                size: 30
                            ),
                            backgroundColor: Colors.amber,
                            title: Text(getTranslated(context,"chooseDate"),style: TextStyle(fontFamily: 'cairo',color: Colors.purple[800]),),
                            centerTitle: true,
                          ),
                          body:Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.7,
                            child: Column(
                              children: [
                                SizedBox(height: 30,),
                                CalendarDatePicker(
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021,1),
                                  lastDate: DateTime(2021,12),
                                  onDateChanged: (date){
                                    setState(() {
                                      String day=date.day.toString();
                                      String month=date.month.toString();
                                      String year=date.year.toString();
                                      dateTime='$day-$month-$year';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          bottomSheet: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text(getTranslated(context,"confirmButton"),style: TextStyle(fontFamily: 'cairo',color: Colors.amber),),
                              style: ElevatedButton.styleFrom(

                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)))
                              ),
                              onPressed: (){
                                Navigator.pop(context,dateTime);
                              },
                            ),
                          ),
                        )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dateTime??'',style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 16),),
                            Image(image: AssetImage('assets/icons/calendar.png'),height: 30,width: 30,),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                ),
              ) ,
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(getTranslated(context,"chooseTime"),style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontWeight: FontWeight.bold),),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child:Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40)),
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: InkWell(
                      onTap: ()async{
                        await Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.amber,
                            iconTheme: IconThemeData(
                                color: Colors.purple[800],
                                size: 30
                            ),
                            title: Text(getTranslated(context, 'chooseTime'),style: TextStyle(fontFamily: 'cairo',color: Colors.purple[800]),),
                            centerTitle: true,
                          ),
                          body:CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (time){
                              setState(() {
                                String min=time.minute.toString();
                                String hour=time.hour.toString();
                                timePicker='$hour:$min';
                                print(timePicker);
                              });
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                          bottomSheet: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text(getTranslated(context,"confirmButton"),style: TextStyle(fontFamily: 'cairo',color: Colors.amber),),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)))
                              ),
                              onPressed: (){
                                print(timePicker);
                                Navigator.pop(context,timePicker);
                              },
                            ),
                          ),
                        )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(timePicker??'',style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontSize: 16),),
                            Image(image: AssetImage('assets/icons/clock.png'),height: 30,width: 30,),

                          ],
                        ),
                      ),
                    ),
                  ) ,
                ),
              ) ,
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: (){
                 onAddToCart(widget.typeId,context);
              },
                style:ElevatedButton.styleFrom(padding:const EdgeInsets.symmetric(horizontal: 150,vertical: 10),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),),
                child: Text(getTranslated(context, "confirmButton"),style: TextStyle(color: Colors.amber,fontFamily: 'cairo',fontSize: 16),),
              ),
            )
          ],
        );
      },
    );
  }
}
