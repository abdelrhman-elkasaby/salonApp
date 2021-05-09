part of 'notificationImports.dart';

class Notifications extends StatefulWidget {
  static const routeName="notificationScreen";
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> with NotificationData{
  @override
  void initState() {
    onFetchNotificationData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        backgroundColor: Colors.amber,
        title: Text(getTranslated(context, "notification"),style: TextStyle(color: Colors.purple[800]),),
        centerTitle: true,
      ),
      body:BlocBuilder<GenericCubit<ModelNotification>, GenericState<ModelNotification>>(
        bloc: notificationCubit,
        builder: (context, state) {
           if(state is GenericUpdateState)
             {
               if(state.data.data.isEmpty){
                 return Center(child: Text('لا يوجد اشعارات',style: TextStyle(fontFamily: 'cairo',fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),);
               }else{
                 return Container(
                   color: Colors.grey.withOpacity(0.1),
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                   child: ListView.builder(
                       itemCount: state.data.data.length,
                       itemBuilder:(context,index){
                         return ListTile(
                           title: Text(state.data.data[index].title,style: TextStyle(fontSize: 16,fontFamily: 'cairo',fontWeight: FontWeight.bold),),
                           subtitle: Text(state.data.data[index].msg,style: TextStyle(fontFamily: 'cairo',fontSize: 14),),
                         );
                       }
                   ),
                 );
               }
             }else{
             return Center(child: CircularProgressIndicator(),);
           }
          },
        ),
    );
  }
}
