part of 'choose_language_imports.dart';
class ChooseLanguageScreen extends StatefulWidget {
  static const routeName = 'chooseLanguageScreen';
  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}
class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> with ChooseLanguageData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 220, bottom: 70),
              child: Image(
                image: AssetImage('assets/icons/logotwo.png'),
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                getTranslated(context,"chooseLanguage"),
                style: TextStyle(
                  color: Colors.purple[800],
                  decoration: TextDecoration.none,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: RaisedButton(
                    elevation: 0.0,
                    onPressed: () {
                      changeLanguage(Language('en',"English"),context);
                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'English',
                      style: TextStyle(fontSize: 15),
                    ),
                    color: Colors.white,
                    textColor: Colors.purple[800],
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow[600]),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: RaisedButton(
                    onPressed: () {
                      changeLanguage(Language('ar',"العربية"),context);
                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'العربية',
                      style: TextStyle(fontSize: 15),
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    textColor: Colors.purple[800],
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 30),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
