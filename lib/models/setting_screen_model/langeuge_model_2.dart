import 'dart:convert';

LanguageModel2 languageModel2FromJson(String str) =>
    LanguageModel2.fromJson(json.decode(str));

String languageModel2ToJson(LanguageModel2 data) => json.encode(data.toJson());

class LanguageModel2 {
  int? status;
  String? message;
  List<Datum>? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  LanguageModel2({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory LanguageModel2.fromJson(Map<String, dynamic> json) => LanguageModel2(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<Datum>.from(json["Data"]!.map((x) => Datum.fromJson(x))),
        validationMessage: json["ValidationMessage"] == null
            ? []
            : List<dynamic>.from(json["ValidationMessage"]!.map((x) => x)),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "ValidationMessage": validationMessage == null
            ? []
            : List<dynamic>.from(validationMessage!.map((x) => x)),
        "ErrorMessage": errorMessage,
      };
}

class Datum {
  dynamic availableLanguages;
  int? currentLanguageId;
  bool? useImages;
  int? id;
  String? name;
  String? languageCulture;
  String? uniqueSeoCode;
  String? flagImageFileName;
  bool? rtl;
  bool? limitedToStores;
  int? defaultCurrencyId;
  bool? published;
  int? displayOrder;

  Datum({
    this.availableLanguages,
    this.currentLanguageId,
    this.useImages,
    this.id,
    this.name,
    this.languageCulture,
    this.uniqueSeoCode,
    this.flagImageFileName,
    this.rtl,
    this.limitedToStores,
    this.defaultCurrencyId,
    this.published,
    this.displayOrder,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        availableLanguages: json["AvailableLanguages"],
        currentLanguageId: json["CurrentLanguageId"],
        useImages: json["UseImages"],
        id: json["id"],
        name: json["Name"],
        languageCulture: json["LanguageCulture"],
        uniqueSeoCode: json["UniqueSeoCode"],
        flagImageFileName: json["FlagImageFileName"],
        rtl: json["Rtl"],
        limitedToStores: json["LimitedToStores"],
        defaultCurrencyId: json["DefaultCurrencyId"],
        published: json["Published"],
        displayOrder: json["DisplayOrder"],
      );

  Map<String, dynamic> toJson() => {
        "AvailableLanguages": availableLanguages,
        "CurrentLanguageId": currentLanguageId,
        "UseImages": useImages,
        "id": id,
        "Name": name,
        "LanguageCulture": languageCulture,
        "UniqueSeoCode": uniqueSeoCode,
        "FlagImageFileName": flagImageFileName,
        "Rtl": rtl,
        "LimitedToStores": limitedToStores,
        "DefaultCurrencyId": defaultCurrencyId,
        "Published": published,
        "DisplayOrder": displayOrder,
      };
}
