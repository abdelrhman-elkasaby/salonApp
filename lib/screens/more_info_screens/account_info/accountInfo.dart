part of 'accountInfoImports.dart';
class AccountInformation extends StatefulWidget {
  static const routeName="accountInfo";
  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> with AccountInfoData{
  @override
  void initState() {
    onFetchProfileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          color: Colors.purple[800],
          icon: Icon(Icons.arrow_back),
          onPressed:()=> Navigator.of(context).pushReplacementNamed(RoutePage.routeName),
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text(getTranslated(context, "accountInformation"),
            style: TextStyle(
                color: Colors.purple[800], fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:BlocBuilder<GenericCubit<ModelProfile>, GenericState<ModelProfile>>(
        bloc: profileCubit,
          builder: (context, state) {
          if(state is GenericUpdateState)
            {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            state.data.data.image,
                            fit: BoxFit.fill,
                            width: 120,
                            height: 120,
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.data.data.name,
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: ImageIcon(AssetImage('assets/icons/edit.png')),
                            onPressed: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EditAccount(state.data.data.image))))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, "phone"),
                            style: TextStyle(
                                color: Colors.purple[800], fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(40)),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                              child: Text(state.data.data.phone,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',fontWeight: FontWeight.bold),),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            }else{
            return Center(child: CircularProgressIndicator(),);
          }
  },
),
    );
  }
}
