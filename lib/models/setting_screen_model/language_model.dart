import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    required this.languages,
  });

  final List<Language> languages;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    required this.name,
    required this.languageCulture,
    required this.uniqueSeoCode,
    required this.flagImageFileName,
    required this.rtl,
    required this.limitedToStores,
    required this.defaultCurrencyId,
    required this.published,
    required this.displayOrder,
    required this.id,
  });

  final String name;
  final String languageCulture;
  final String uniqueSeoCode;
  final String flagImageFileName;
  final bool rtl;
  final bool limitedToStores;
  final int defaultCurrencyId;
  final bool published;
  final int displayOrder;
  final int id;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["Name"],
        languageCulture: json["LanguageCulture"],
        uniqueSeoCode: json["UniqueSeoCode"],
        flagImageFileName: json["FlagImageFileName"],
        rtl: json["Rtl"],
        limitedToStores: json["LimitedToStores"],
        defaultCurrencyId: json["DefaultCurrencyId"],
        published: json["Published"],
        displayOrder: json["DisplayOrder"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "LanguageCulture": languageCulture,
        "UniqueSeoCode": uniqueSeoCode,
        "FlagImageFileName": flagImageFileName,
        "Rtl": rtl,
        "LimitedToStores": limitedToStores,
        "DefaultCurrencyId": defaultCurrencyId,
        "Published": published,
        "DisplayOrder": displayOrder,
        "id": id,
      };
}
