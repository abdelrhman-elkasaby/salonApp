part of 'myOrdersImports.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}
class _MyOrdersState extends State<MyOrders> with SingleTickerProviderStateMixin {
  TabController tabController;
  final GenericCubit<ModelOrders> ordersCubit = GenericCubit<ModelOrders>(null);
  onFetchOrders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getInt('userId',);
    Map<String, dynamic> body = {
      'user_id': userId
    };
    var response = await Utils().api().post(url: 'my-reservations', body: body);
    ModelOrders modelOrders = ModelOrders.fromJson(response.data);
    ordersCubit.onUpdateData(modelOrders);
  }
  @override
  void initState() {
    onFetchOrders();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          getTranslated(context, 'orders'),
          style:
          TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(Notifications.routeName),
            child: ImageIcon(
              AssetImage('assets/icons/notification.png'),
              size: 30,
              color: Colors.purple[800],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              child: ImageIcon(
                AssetImage('assets/icons/cart.png'),
                size: 30,
                color: Colors.purple[800],
              ),
              onTap: () => Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GenericCubit<ModelOrders>, GenericState<ModelOrders>>(
        bloc: ordersCubit,
        builder: (context, state) {
          if (state is GenericUpdateState)
            {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 60, right: 60),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.purple[800], style: BorderStyle.solid)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TabBar(
                            indicatorColor: Colors.purple[800],
                            labelColor: Colors.purple[800],
                            indicator: BoxDecoration(
                              color: Colors.purple[800],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all( color: Colors.purple[800],
                                  width: 1,
                                  style: BorderStyle.solid
                              ),
                            ),
                            labelPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: tabController,
                            tabs: [
                              Text(
                                getTranslated(context, "currently"),
                                style: TextStyle(color: Colors.amber),
                              ),
                              Text(
                                getTranslated(context, "expired"),
                                style: TextStyle(color: Colors.amber),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: ListView.builder(
                                  itemCount: state.data.data.current.length,
                                  itemBuilder:(context,index){
                                    return InkWell(
                                      onTap:()=>Navigator.of(context).pushNamed(OrderDetails.routeName),
                                      child: CardOrder(state.data.data.current[index].image,
                                          state.data.data.current[index].name, state.data.data.current[index].id),
                                    );
                                  }
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: ListView.builder(
                                  itemCount: state.data.data.previous.length,
                                  itemBuilder:(context,index){
                                    return CardOrder(state.data.data.previous[index].image,
                                        state.data.data.previous[index].name, state.data.data.previous[index].id);
                                  }
                              ),
                            )
                          ]),
                    )
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
