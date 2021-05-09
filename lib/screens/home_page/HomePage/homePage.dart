part of 'HomePageImports.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with HomePageData{
  @override
  void initState() {
    onFetchHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      appBar: buildAppBar(context),
      body: BlocBuilder<GenericCubit<HomeModel>, GenericState<HomeModel>>(
        bloc: homeCubit,
  builder: (context, state) {
      if(state is GenericUpdateState)
        {
          return Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Column(
                    children: [
                      buildCarousel(context,state.data),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [buildContainer(0), buildContainer(1)],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.51,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () async{
                                    SharedPreferences pref=await SharedPreferences.getInstance();
                                    pref.setInt('providerId', state.data.data.providers[index].id);
                                    print(state.data.data.providers[index].id);
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context)=>OperatorName(state.data.data.providers[index].name)));
                                  },
                                  child: CardHomePage(
                                    state.data.data.providers[index].image,
                                    state.data.data.providers[index].name,
                                    state.data.data.providers[index].rate.toDouble(),
                                    state.data.data.providers[index].address,
                                  ),
                                ),
                              );
                            },
                            itemCount: state.data.data.providers.length,
                          )),
                    ],
                  )
          );
        }else{
        return Center(child: CircularProgressIndicator(),);
      }
  },
),
    );
  }
}
