part of 'more_info_language_imports.dart';
class MoreInfoLanguageData{
  void changeLanguage(Language language,BuildContext context) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }
}