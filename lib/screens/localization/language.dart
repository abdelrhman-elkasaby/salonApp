class Language {

  final String languageCode;
  final String name;

  Language(this.languageCode,this.name);

  static List<Language> languageList() {
    return <Language>[
      Language("en",'English'),
      Language("ar","العربية"),
    ];
  }
}