part of 'More_info_page_imports.dart';
class MoreInfoPage extends StatefulWidget {
  @override
  _MoreInfoPageState createState() => _MoreInfoPageState();
}
class _MoreInfoPageState extends State<MoreInfoPage> with MoreInfoPageData{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.purple[800],
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(RoutePage.routeName),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: (){
                Provider.of<AuthProvider>(context,listen: false).onLogout(context);
              },
              child: ImageIcon(
                AssetImage('assets/icons/logout.png'),
                size: 30,
                color: Colors.purple[800],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            buildListTile(
              'assets/icons/profile.png',
              getTranslated(context, "accountInformation"),
              getTranslated(context, "personalInformation"),
              () => Navigator.of(context).pushReplacementNamed(AccountInformation.routeName),
            ),
            const SizedBox(
              height: 5,
            ),
            buildListTile(
              'assets/icons/lang.png',
              getTranslated(context, "language"),
              getTranslated(context, "controlLanguage"),
              () => Navigator.of(context).pushNamed(MoreInfoLanguage.routeName),
            ),
            const SizedBox(
              height: 5,
            ),
            buildListTile(
              'assets/icons/call.png',
              getTranslated(context, "callUs"),
              getTranslated(context, "contactWithUs"),
              ()=>Navigator.of(context).pushNamed(CallUs.routeName),
            ),
            const SizedBox(
              height: 5,
            ),
            buildListTile(
              'assets/icons/aboutus.png',
              getTranslated(context, "whoWeAre"),
              getTranslated(context, "moreAboutUs"),
              ()=>Navigator.of(context).pushNamed(WhoWeAre.routeName),
            ),
            const SizedBox(
              height: 5,
            ),
            buildListTile(
              'assets/icons/terms.png',
              getTranslated(context, "termsAndConditions"),
              getTranslated(context, "moreAboutUs"),
              ()=>Navigator.of(context).pushNamed(TermsAndConditions.routeName),
            )
          ],
        ),
      ),
    );
  }
}
