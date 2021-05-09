part of 'choose_language_imports.dart';


class ChooseLanguageData{

  void changeLanguage(Language language,BuildContext context)async{
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }
}