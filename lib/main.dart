part of 'mainImports.dart';
SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();
  await setupLocator();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    var isLogin = preferences.get('isLogin') ?? false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child);
            child = botToastBuilder(context, child);
            return child;
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          localizationsDelegates: [
            DemoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
          locale: _locale,
          theme: ThemeData(
            fontFamily: 'cairo',
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.purple[800]))),
            primarySwatch: Colors.purple,
            accentColor: Colors.deepPurpleAccent,
          ),
          home: isLogin ? RoutePage() : SplashScreen(),
          routes: {
            ChooseLanguageScreen.routeName: (_) => ChooseLanguageScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            SignUp.routeName: (_) => SignUp(),
            TermsAndConditions.routeName: (_) => TermsAndConditions(),
            VerifyAcc.routeName: (_) => VerifyAcc(),
            ForgetPassword.routeName: (_) => ForgetPassword(),
            RestorePassword.routeName: (_) => RestorePassword(),
            RoutePage.routeName: (_) => RoutePage(),
            CartScreen.routeName: (_) => CartScreen(),
            Notifications.routeName: (_) => Notifications(),
            AccountInformation.routeName: (_) => AccountInformation(),
            MoreInfoLanguage.routeName: (_) => MoreInfoLanguage(),
            CallUs.routeName: (_) => CallUs(),
            WhoWeAre.routeName: (_) => WhoWeAre(),
            OrderDetails.routeName: (_) => OrderDetails(),
            ChoosePaymentMethod.routeName: (_) => ChoosePaymentMethod()
          },
        ),
      ),
    );
  }
}
