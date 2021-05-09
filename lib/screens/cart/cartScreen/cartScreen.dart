part of 'cartScreenImports.dart';
class CartScreen extends StatefulWidget {
  static const routeName = "cartScreen";
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> with CartScreenData {
  @override
  void initState() {
    onFetchCartData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800], size: 30),
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          getTranslated(context, "cart"),
          style: TextStyle(color: Colors.purple[800]),
        ),
      ),
      body: BlocBuilder<GenericCubit<ModelMyCart>, GenericState<ModelMyCart>>(
        bloc: cartCubit,
        builder: (context, state) {
          if(state is GenericUpdateState)
            {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CartReservation(state.data.data[index].providerId))),
                    child: CardHomePage(
                      state.data.data[index].image,
                      state.data.data[index].name,
                      state.data.data[index].rate.toDouble(),
                      state.data.data[index].address,
                    ),
                  );
                },
                itemCount: state.data.data.length,
              );
            }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
