part of 'cartReservationImports.dart';

class CartReservation extends StatefulWidget {
  final providerId;

  const CartReservation(this.providerId);

  @override
  _CartReservationState createState() => _CartReservationState();
}

class _CartReservationState extends State<CartReservation>
    with CartReservationData {
  @override
  void initState() {
    onFetchCartData(widget.providerId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          getTranslated(context, "cart"),
          style: TextStyle(color: Colors.purple[800], fontFamily: 'cairo'),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.purple[800], size: 30),
      ),
      body: BlocBuilder<GenericCubit<ModelCartDetails>,
          GenericState<ModelCartDetails>>(
        bloc: cartDataCubit,
        builder: (context, state) {
          if(state is GenericUpdateState){
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.1),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CardOrder(
                            state.data.data.provider.image,
                            state.data.data.provider.name,
                            state.data.data.provider.id),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                            // scrollDirection: Axis.vertical,
                            // shrinkWrap: true,
                              itemCount: state.data.data.carts.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.purple.withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(25)),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image(
                                                image: AssetImage('assets/icons/logotwo.png'), height: 40, width: 40),
                                            Text(
                                              getTranslated(
                                                  context, "orderNumber"),
                                              style: TextStyle(color: Colors.amber, fontFamily: 'cairo', fontSize: 12),
                                            ),
                                            Text(
                                                "${state.data.data.provider.id}",
                                                style: TextStyle(color: Colors.amber, fontFamily: 'cairo', fontSize: 12))
                                          ],
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.65,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    getTranslated(context, "serviceDetails"),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .purple[800],
                                                        fontFamily: 'cairo',
                                                        fontSize: 13),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      String reservationId =
                                                      state.data.data.carts[index].id.toString();
                                                      print(reservationId);
                                                      onDeleteCartData(reservationId);
                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CartScreen()));
                                                    },
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/icons/close.png'),
                                                      width: 20,
                                                      height: 20,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            buildRowService(getTranslated(context, "kindOfService"), state.data.data.carts[index].name),
                                            buildRowServicePrice(getTranslated(context, "servicePrice"), state.data.data.carts[index].price.toString()),
                                            buildRowService(getTranslated(context, "serviceTime"), state.data.data.carts[index].time),
                                            buildRowService(getTranslated(context, "serviceDate"), state.data.data.carts[index].date),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          color: Colors.grey,
                          height: 2,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10,),
                      Text(getTranslated(context, "paymentWay"),
                        style: TextStyle(color: Colors.purple[800], fontFamily: 'cairo'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20,),
                      Image(
                        image: AssetImage('assets/icons/coins.png'), width: 40, height: 40,
                      ),
                      const SizedBox(width: 10,),
                      Text(getTranslated(context, "cash"),
                        style: TextStyle(color: Colors.purple[800], fontFamily: 'cairo'),
                      ),
                      const SizedBox(width: 140,),
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pushNamed(ChoosePaymentMethod.routeName),
                          child: Text(getTranslated(context, "change"),
                            style: TextStyle(color: Colors.amber, fontFamily: 'cairo'),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10,),
                      Text(getTranslated(context, "discountCard"),
                        style: TextStyle(color: Colors.purple[800], fontFamily: 'cairo'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        filled: true,
                        fillColor: Colors.purple.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.purple[800],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)))),
                      child: Text(
                        getTranslated(context, "reservation"),
                        style: TextStyle(color: Colors.amber, fontFamily: 'cairo'),
                      ),
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
