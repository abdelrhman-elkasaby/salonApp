part of 'operatorNameImports.dart';
class OperatorName extends StatefulWidget with OperatorNameData {
  final String name;
  const OperatorName(this.name);
  @override
  _OperatorNameState createState() => _OperatorNameState();
}
class _OperatorNameState extends State<OperatorName> with SingleTickerProviderStateMixin {
  TabController tabController;
  final GenericCubit<ModelProviderDetails> operatorCubit = GenericCubit(null);
  onFetchProviderDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId');
    var providerId = preferences.getInt('providerId');
    print(providerId);
    Map<String, dynamic> body = {
      'provider_id': providerId,
      'lang': 'ar',
      'user_id': userId
    };
    var response =
        await Utils().api().post(url: 'provider-details', body: body);
    ModelProviderDetails modelProviderDetails =
        ModelProviderDetails.fromJson(response.data);
    operatorCubit.onUpdateData(modelProviderDetails);
  }
  @override
  void initState() {
    onFetchProviderDetails();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(CartScreen.routeName),
                  child: ImageIcon(
                    AssetImage('assets/icons/cart.png'),
                    size: 30,
                    color: Colors.purple[800],
                  )),
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Colors.purple[800],
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(RoutePage.routeName),
          ),
          backgroundColor: Colors.amber,
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.purple[800]),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GenericCubit<ModelProviderDetails>,
            GenericState<ModelProviderDetails>>(
          bloc: operatorCubit,
          builder: (context, state) {
            if(state is GenericUpdateState)
              {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      widget.buildCarousel(context, state.data),
                      TabBar(
                        controller: tabController,
                        labelStyle: TextStyle(fontFamily: 'cairo'),
                        indicatorColor: Colors.grey.withOpacity(0.1),
                        labelPadding: EdgeInsets.all(8),
                        unselectedLabelStyle: TextStyle(
                            color: Colors.amber.withOpacity(0.1),
                            fontFamily: 'cairo'),
                        tabs: [
                          Text(
                            getTranslated(context, "information"),
                            style: TextStyle(color: Colors.amber),
                          ),
                          Text(
                            getTranslated(context, "services"),
                            style: TextStyle(color: Colors.amber),
                          ),
                          Text(
                            getTranslated(context, "offers"),
                            style: TextStyle(color: Colors.amber),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            //first tab view
                            OperatorInformation(),
                            //second tab view
                            OperatorServices(),
                            //third tab view
                            OperatorOffers()
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ));
  }
}
