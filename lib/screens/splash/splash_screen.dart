part of 'splash_screenImports.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),()=>Navigator.of(context).pushReplacementNamed(ChooseLanguageScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.purple[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              fit: BoxFit.scaleDown,
              image: AssetImage(
                'assets/icons/logoone.png',
              ),
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
