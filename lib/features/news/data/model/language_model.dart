class LanguageModel {
  final String name;
  final String lang;

  LanguageModel({
    required this.name,
    required this.lang,
  });


  factory LanguageModel.fromJson(
      Map<String, dynamic> json) {

    return LanguageModel(
      name: json['name'] ?? '',
      lang: json['lang'] ?? '',
    );
  }
}