part of 'HomePageImports.dart';
class HomePageData{

final GenericCubit<HomeModel> homeCubit=GenericCubit(null);

onFetchHomeData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var userId = preferences.getInt('userId');
  String phone=preferences.getString('phone');
  print(userId);
  print(phone);
  Map<String,dynamic> body = {
    'category_id': 1,
    'lang': 'ar',
  };
  var response = await Utils().api().post(url: 'home', body: body);
  HomeModel homeModel = HomeModel.fromJson(response.data);
  homeCubit.onUpdateData(homeModel);

}
  int currentIndex;
  int selectedPageIndex = 0;
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: [
        InkWell(
          child: Image.asset(
            'assets/icons/notification.png',
            width: 30,
            height: 30,
          ),
          onTap: () =>
              Navigator.of(context).pushNamed(Notifications.routeName),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: InkWell(
            child: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 30,
            ),
            onTap: () => Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        )
      ],
      backgroundColor: Colors.amber,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Image.asset(
              'assets/icons/filter.png',
              width: 30,
              height: 30,
            ),
            onTap: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.purple[800],
                size: 30,
              ),
              onPressed: () {}),
          SizedBox(
            width: 50,
          ),
          Text(
            getTranslated(context, 'homePageTitle'),
            style: TextStyle(
                color: Colors.purple[800], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Container buildContainer(index) {
    return Container(
      width: 7,
      height: 7,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.purple[800] : Colors.grey),
    );
  }

  Widget buildCarousel(BuildContext context, HomeModel homeModel) {
    if (homeModel.data.slider.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Center(child: Text('لا يوجد صور',style: TextStyle(fontFamily: 'cairo'),)),
      );
    }
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 0.25,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            homeModel.data.slider[index],
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: homeModel.data.slider.length,
    );
  }

}