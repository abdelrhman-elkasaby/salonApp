
part of 'more_info_language_imports.dart';
class MoreInfoLanguage extends StatefulWidget {
  static const routeName = "moreInfoLanguage";

  @override
  _MoreInfoLanguageState createState() => _MoreInfoLanguageState();
}

class _MoreInfoLanguageState extends State<MoreInfoLanguage> with MoreInfoLanguageData{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple[800],size: 30),
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text(
          getTranslated(context, "language"),
          style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontFamily: 'cairo'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                getTranslated(context, "language"),
                style: TextStyle(
                    color: Colors.purple[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              DropdownButton(
                icon: Icon(Icons.language,color: Colors.purple[800],),
                onChanged: (Language language){
                  changeLanguage(language,context);
                },
                hint: Text(getTranslated(context, "chooseLanguage"),style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'cairo'),),
                style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize: 16),
                iconSize: 25,
                underline: SizedBox(),
                items: Language.languageList().map((lang) => DropdownMenuItem(
                  value: lang,
                  child: Row(
                    children: [
                      Text(lang.name,style: TextStyle(color: Colors.purple[800],fontFamily: 'cairo',),)
                    ],
                  ),
                )).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
