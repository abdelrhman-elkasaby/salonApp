
part of 'route_page_imports.dart';
class RoutePage extends StatefulWidget {
  static const routeName='routePage';
  @override
  _RoutePageState createState() => _RoutePageState();
}
class _RoutePageState extends State<RoutePage> with HomePageData{
  List<Widget> pages=[
    HomePage(),
    MyOrders(),
    MoreInfoPage()
  ];
  void pageSelected(int index){
    setState(() {
      selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body:pages[selectedPageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35)),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Colors.purple[800],
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.amber,
          onTap: pageSelected,
          currentIndex: selectedPageIndex,
          items: [
            BottomNavigationBarItem(icon:selectedPageIndex==0?ImageIcon(AssetImage('assets/icons/home_active.png')) :ImageIcon(AssetImage('assets/icons/home.png')),label: getTranslated(context, 'homePageTitle')),
            BottomNavigationBarItem(icon:selectedPageIndex==1?ImageIcon(AssetImage('assets/icons/order_active.png')) :ImageIcon(AssetImage('assets/icons/order.png')),label: getTranslated(context, 'orders')),
            BottomNavigationBarItem(icon:selectedPageIndex==2?ImageIcon(AssetImage('assets/icons/dotes_active.png')) :ImageIcon(AssetImage('assets/icons/dotes.png')),label: getTranslated(context, 'more')),
          ]
        ),
      ),
    );
  }
}
